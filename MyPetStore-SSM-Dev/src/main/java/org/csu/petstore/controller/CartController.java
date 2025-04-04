package org.csu.petstore.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import org.csu.petstore.common.CommonResponse;
import org.csu.petstore.entity.Product;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.service.UserService;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.CartItemVO;
import org.csu.petstore.vo.CartVO;
import org.csu.petstore.vo.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class CartController
{
    @Autowired
    CatalogService catalogService;
    @Autowired
    UserService userService;


    // 查看购物车
    @GetMapping("/carts")
    @ResponseBody
    public CommonResponse<Object> viewCart(HttpSession session) {
        AccountVO loginAccount = (AccountVO) session.getAttribute("loginAccount");
        if (loginAccount == null) {
            return CommonResponse.createForError("Please log in first");
        }else{
            CartVO cartVO = userService.getCart(loginAccount.getUsername());
            return CommonResponse.createForSuccess(cartVO);
        }
    }
    @PutMapping("/carts")
    public Object updateCart(HttpSession session,
                             HttpServletRequest request) {
        AccountVO loginAccount = (AccountVO) session.getAttribute("loginAccount");
        if (loginAccount == null) {
            return CommonResponse.createForError("Please log in first");
        }
        CartVO cart = userService.getCart(loginAccount.getUsername());
        Iterator<CartItemVO> cartItems = cart.getCartItems();
        while (cartItems.hasNext()) {
            CartItemVO cartItem = cartItems.next();
            String itemId = cartItem.getItem().getItemId();
            try {
                String quantityString = (String) request.getAttribute(itemId);
                int quantity = Integer.parseInt(quantityString);

                cartItem.setQuantity(quantity);
                if (quantity < 1) {
                    userService.deleteItem(loginAccount.getUsername(), cartItem);
                } else {
                    if(catalogService.checkItemQuantity(cartItem.getItem().getItemId(),quantity)){
                        userService.updateCart(loginAccount.getUsername(), cartItem);
                    }else{
                        session.setAttribute("viewNewOrderMsg","Not enough stock");
                        return "cart/cart";
                    }

                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        CartVO cartVO = userService.getCart(loginAccount.getUsername());
        session.setAttribute("cart", cartVO);
        return "cart/cart";
    }

    @PostMapping("/carts/{itemId}")
    @ResponseBody
    public CommonResponse<Object> addItemToCart(@PathVariable("itemId") String workingItemId, HttpSession session) {
        AccountVO loginAccount = (AccountVO) session.getAttribute("loginAccount");
        if (loginAccount == null) {
            return CommonResponse.createForError("Please log in first");
        }else{
            CartVO currentCart = userService.getCart(loginAccount.getUsername());
            CartItemVO cartItem = currentCart.getItemMap().get(workingItemId);
            if(cartItem == null){
                CartItemVO newCartItem = new CartItemVO();
                ItemVO itemVO = catalogService.getItem(workingItemId);
                if(catalogService.checkItemQuantity(workingItemId,1)){
                    Boolean isInStock = catalogService.isItemInStock(itemVO.getItemId());
                    newCartItem.setItem(itemVO);
                    newCartItem.setQuantity(1);
                    newCartItem.setInStock(isInStock);
                    userService.addCartItem(loginAccount.getUsername(), newCartItem);

                    Date date = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
                    String currentDate = formatter.format(date);
                    String addItemString = "User "+ loginAccount.getUsername() + " added product "
                            + "<a href=\"itemForm?itemId=" + workingItemId + "\">" + workingItemId + "</a>"
                            + " to the <a href=\"cartForm\">cart</a>.";
                    userService.updateJournal(loginAccount.getUsername(), addItemString, currentDate, "#FFC000");
                    return CommonResponse.createForSuccess("Successfully added new item to the cart");
                }else {
                    return CommonResponse.createForError(2,"item is not in stock");
                }
            }
            else
            {
                if(catalogService.checkItemQuantity(workingItemId,cartItem.getQuantity()+1)){
                    cartItem.incrementQuantity();
                    userService.updateCart(loginAccount.getUsername(), cartItem);
                    return CommonResponse.createForSuccess("Successfully added item to the cart");
                }else {
                    return CommonResponse.createForError(2,"item is not in stock");
                }

            }
        }
    }

    @DeleteMapping("/carts/{itemId}")
    @ResponseBody
    public CommonResponse<Object> removeItemFromCart(@PathVariable("itemId") String workingItemId, HttpSession session) {
        AccountVO loginAccount = (AccountVO) session.getAttribute("loginAccount");
        CartVO currentCart = userService.getCart(loginAccount.getUsername());
        CartItemVO cartItem = currentCart.getItemMap().get(workingItemId);
        if(cartItem==null){
            return CommonResponse.createForError("Attempted to remove null CartItem from Cart.");
        }else{
            userService.deleteItem(loginAccount.getUsername(), cartItem);
            CartVO cartVO = userService.getCart(loginAccount.getUsername());
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
            String currentDate = formatter.format(date);
            String deleteItemString = "User "+ loginAccount.getUsername() + " deleted product "
                    + "<a href=\"itemForm?itemId=" + workingItemId + "\">" + workingItemId + "</a>"
                    + " from the <a href=\"cartForm\">cart</a>.";
            userService.updateJournal(loginAccount.getUsername(), deleteItemString, currentDate, "#BF9000");
            return CommonResponse.createForSuccess("Successfully removed item from the cart");
        }
    }

    @PutMapping("/carts/{itemId}")
    @ResponseBody
    public CommonResponse<Object> updateItemQuantity(@PathVariable("itemId") String workingItemId,
                                                     @RequestParam("quantity") int quantity,
                                                     HttpSession session) {
        AccountVO loginAccount = (AccountVO) session.getAttribute("loginAccount");
        if (loginAccount == null) {
            return CommonResponse.createForError("Please log in first");
        }
        CartVO currentCart = userService.getCart(loginAccount.getUsername());
        CartItemVO cartItem = currentCart.getItemMap().get(workingItemId);
        Map<String, BigDecimal> totals = new HashMap<>();
        try
        {
            if (quantity < 1)
            {
                userService.deleteItem(loginAccount.getUsername(),cartItem);
            }
            else
            {
                if(catalogService.checkItemQuantity(cartItem.getItem().getItemId(),quantity)){
                    cartItem.setQuantity(quantity);
                    userService.updateCart(loginAccount.getUsername(),cartItem);
                } else{
                    totals.put("isOk", BigDecimal.valueOf(cartItem.getQuantity()));
                    return CommonResponse.createForError(2,"item is not in stock", totals);
                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        CartVO newCart = userService.getCart(loginAccount.getUsername());
        totals.put("cartItemTotal", cartItem.getTotal());
        totals.put("subTotal", newCart.getSubTotal());
        totals.put("isOk", null);
        return CommonResponse.createForSuccess(totals);
    }

    // 获得喜爱列表
    @GetMapping("/favouriteList")
    @ResponseBody
    public CommonResponse<Object> viewFavouriteList(HttpSession session) {
        AccountVO loginAccount = (AccountVO) session.getAttribute("loginAccount");
        if (loginAccount.isListOption()){
            List<Product> productList = catalogService.getProductListByCategory(loginAccount.getFavouriteCategoryId());
            return CommonResponse.createForSuccess(productList);
        }else {
            return CommonResponse.createForError("The favorites list feature is not turned on");
        }

    }
}
