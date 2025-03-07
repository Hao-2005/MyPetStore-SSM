package org.csu.petstore.controller;

import org.csu.petstore.entity.UserAddress;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.service.UserService;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.CartVO;
import org.csu.petstore.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
@SessionAttributes(value = {"productList","order","shippingAddressRequired","loginAccount","addresses","confirmed"})
public class OrderController {
    private boolean shippingAddressRequiredBool;
    private boolean shipAddressSubmittedBool;
    private boolean confirmedBool;
    private boolean newOrderFormSubmited;
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;

    @RequestMapping("/listOrder")
    public String listOrders(Model model) {
        AccountVO loginAccount =(AccountVO) model.asMap().get("loginAccount");
        List<OrderVO> orderVOList = orderService.getOrdersByUsername(loginAccount.getUsername());
        model.addAttribute("orderList", orderVOList);
        return "order/listOrder";
    }

    @RequestMapping("/viewOrder")
    public String viewOrder(@RequestParam(defaultValue  = "-1") int orderId,
                            Model model) {
        if(orderId != -1) {
            AccountVO loginAccount =(AccountVO) model.asMap().get("loginAccount");
            OrderVO orderVO = orderService.getOrderWithLineItem(orderId);
            model.addAttribute("order", orderVO);
            return "order/viewOrder";
        }else{
            return "order/listOrder";
        }

    }



    @RequestMapping("/viewNewOrder")
    public String viewNewOrder(@ModelAttribute("loginAccount") AccountVO loginAccount,
                           @ModelAttribute("cart") CartVO cart,
                           Model model) {
        if(loginAccount == null) {
            return "/account/login";
        }else{
            OrderVO orderVO = new OrderVO();
            orderVO.initOrder(loginAccount, cart);
            model.addAttribute("order", orderVO);
            List<UserAddress> userAddressList = userService.getUserOKAddressByUsername(loginAccount.getUsername());
            model.addAttribute("addresses", userAddressList);
            return "order/newOrder";
        }
    }

    @RequestMapping("/newOrder")
    public String newOrder(@ModelAttribute("loginAccount") AccountVO loginAccount,
                           @ModelAttribute("cart") CartVO cart,
                           @ModelAttribute("order") OrderVO order,
                           @RequestParam(required = false,value = "order.shippingAddress1") String shippingAddress1,
                           @RequestParam(required = false,value = "order.shippingAddress2") String shippingAddress2,
                           @RequestParam(required = false,value = "order.shippingCity") String shippingCity,
                           @RequestParam(required = false,value = "order.shippingState") String shippingState,
                           @RequestParam(required = false,value = "order.shipZip") String shipZip,
                           @RequestParam(required = false,value = "order.shipCountry") String shipCountry,
                           @RequestParam(required = false,value = "order.shipToFirstName") String shipToFirstName,
                           @RequestParam(required = false,value = "order.shipToLastName") String shipToLastName,
                           @RequestParam(required = false,value = "order.billAddress1") String billAddress1,
                           @RequestParam(required = false,value = "order.billAddress2") String billAddress2,
                           @RequestParam(required = false,value = "order.billCity") String billCity,
                           @RequestParam(required = false,value = "order.billState") String billState,
                           @RequestParam(required = false,value = "order.billZip") String billZip,
                           @RequestParam(required = false,value = "order.billCountry") String billCountry,
                           @RequestParam(required = false,value = "order.billToFirstName") String billToFirstName,
                           @RequestParam(required = false,value = "order.billToLastName") String billToLastName,
                           @RequestParam(required = false,value = "order.cardType") String cardType,
                           @RequestParam(required = false,value = "order.creditCard") String creditCard,
                           @RequestParam(required = false,value = "order.expiryDate") String expiryDate,
                           @RequestParam(required = false,value = "shippingAddressRequired") String shippingAddressRequired,
                           @RequestParam(required = false,value = "shipAddressSubmitted") String shipAddressSubmitted,
                           @RequestParam(required = false,value = "confirmed") String confirmed,
                           Model model) {
        shippingAddressRequiredBool =(shipAddressSubmitted!=null);
        if (shipAddressSubmitted != null) {
            shipAddressSubmittedBool =(shipAddressSubmitted.equals("true"));
        }else{
            shipAddressSubmittedBool = false;
        }
        confirmedBool = (confirmed!=null);

        if(shippingAddressRequiredBool){
            model.addAttribute("shippingAddressRequired", shippingAddressRequired);
            shippingAddressRequiredBool = false;
            return "order/shipAddress";
        }else if(shipAddressSubmittedBool){
            shipAddressSubmittedBool = false;
            UserAddress userAddress = new UserAddress();
            order.setShipAddress1(shippingAddress1);
            order.setShipAddress2(shippingAddress2);
            order.setShipCity(shippingCity);
            order.setShipState(shippingState);
            order.setShipZip(shipZip);
            order.setShipCountry(shipCountry);
            order.setShipToFirstName(shipToFirstName);
            order.setShipToLastName(shipToLastName);
            userAddress.setUsername(loginAccount.getUsername());
            userAddress.setAddress1(shippingAddress1);
            userAddress.setAddress2(shippingAddress2);
            userAddress.setCity(shippingCity);
            userAddress.setState(shippingState);
            userAddress.setZip(shipZip);
            userAddress.setCountry(shipCountry);
            userAddress.setFirstName(shipToFirstName);
            userAddress.setLastName(shipToLastName);
            userAddress.setStatus("OK");
            userService.addUserAddress(userAddress);
            model.addAttribute("order", order);
            return "order/confirmOrder";
        }else if(confirmedBool){
            model.addAttribute("confirmed", confirmed);
            Date date = new Date();
            order.setOrderDate(date);
            order.setOrderId(orderService.getNextOrderId());
            orderService.insertOrder(order);
            model.addAttribute("cart", null);
            userService.deleteCart(loginAccount.getUsername());

            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
            String currentDate = formatter.format(date);
            String addOrderString = "User "+ loginAccount.getUsername() + " added a new order "
                    + "<a href=\"viewOrder?orderId=" + order.getOrderId() + "\">"
                    + order.getOrderId() + "</a>.";
            userService.updateJournal(loginAccount.getUsername(), addOrderString, currentDate, "#ED7D31");

            return "order/viewOrder";
        }else{
            newOrderFormSubmited = false;
            order.setCardType(cardType);
            order.setCreditCard(creditCard);
            order.setExpiryDate(expiryDate);
            order.setBillAddress1(billAddress1);
            order.setBillAddress2(billAddress2);
            order.setBillCity(billCity);
            order.setBillState(billState);
            order.setBillZip(billZip);
            order.setBillCountry(billCountry);
            order.setBillToFirstName(billToFirstName);
            order.setBillToLastName(billToLastName);
            model.addAttribute("order", order);
            return "order/confirmOrder";
        }
    }

    @GetMapping("/chooseAddress")
    @ResponseBody
    public UserAddress changeAddress(@RequestParam("addressId") String addressId,
                                     @ModelAttribute("loginAccount") AccountVO loginAccount,
                                     @ModelAttribute("order") OrderVO order,
                                     Model model){
        UserAddress userAddress = userService.getUserAddressByAddressId(loginAccount.getUsername(),addressId);
        order.setShipAddress1(userAddress.getAddress1());
        order.setShipAddress2(userAddress.getAddress2());
        order.setShipCity(userAddress.getCity());
        order.setShipState(userAddress.getState());
        order.setShipZip(userAddress.getZip());
        order.setShipCountry(userAddress.getCountry());
        order.setShipToFirstName(userAddress.getFirstName());
        order.setShipToLastName(userAddress.getLastName());
        model.addAttribute("order", order);
        return userAddress;
    }

    @GetMapping("/deleteAddress")
    @ResponseBody
    public String deleteAddress(@RequestParam("addressId") String addressId,
                                @ModelAttribute("loginAccount") AccountVO loginAccount,
                                @ModelAttribute("order") OrderVO order,
                                Model model){
        userService.deleteUserAddress(loginAccount.getUsername(),addressId);
        return "delete success";
    }

    @GetMapping("/setAddress")
    @ResponseBody
    public String setAddress(@RequestParam("addressId") String addressId,
                             @ModelAttribute("loginAccount") AccountVO loginAccount,
                             @ModelAttribute("order") OrderVO order,
                             Model model){
        userService.updateMainAddress(loginAccount.getUsername(),addressId);
        return "set main success";
    }

    @GetMapping("/getAddress")
    public UserAddress getAddress(@RequestParam("addressId") String addressId,
                                  @ModelAttribute("loginAccount") AccountVO loginAccount,
                                  @ModelAttribute("order") OrderVO order,
                                  Model model){
        UserAddress userAddress = userService.getUserAddressByAddressId(loginAccount.getUsername(),addressId);
        return userAddress;
    }

}
