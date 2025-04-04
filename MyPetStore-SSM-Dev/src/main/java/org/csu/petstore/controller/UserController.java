package org.csu.petstore.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.csu.petstore.entity.*;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.service.UserService;
import org.csu.petstore.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;


@Controller
@RequestMapping("/user")
@SessionAttributes(value = {"loginAccount","captcha","cart","isAdd","languages","categories","myList"})
public class UserController {

    private String msg;
    @Autowired
    private UserService userService;
    @Autowired
    private CatalogService catalogService;

    @GetMapping("/viewSignon")
    public String viewSignon(Model model)
    {
        String resetMessage = "";
        model.addAttribute("resetMessage", resetMessage);
        return "account/signon";
    }
    
    @RequestMapping("/signon")
    public String signon(@RequestParam("username") String username,
                         @RequestParam("password") String password,
                         //@RequestParam("captchaInput") String captchaInput,
                         Model model) {
        Account loginAccount = userService.getAccountByUsernameAndPssword(username, password);
        /*String captcha = (String) model.asMap().get("captcha");
        System.out.println("captcha:"+captcha);
        System.out.println("captchaInput:"+captchaInput);*/
        if(!validate1(username,password)){
            model.addAttribute("signOnMsg", msg);
            return "account/signon";
        }/*else if(!judgeCaptcha(captchaInput,captcha)){
            model.addAttribute("signOnMsg", msg);
            return "account/signon";
        }*/ else{
            if(loginAccount == null) {
                msg = "用户名或密码错误";
                model.addAttribute("signOnMsg", msg);
                return "account/signon";
            }else {
                AccountVO loginAccountVO = userService.getAccountVOByUsername(username);
                System.out.println("loginAccountVO:"+loginAccountVO);
                model.addAttribute("loginAccount", loginAccountVO);
                return "catalog/main";
            }
        }
    }

    @GetMapping("/signOff")
    public String signOff(@ModelAttribute("loginAccount") AccountVO loginAccount,
                          HttpSession session,
                          Model model) {
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        String currentDate = formatter.format(date);
        String loginOutString = "User "+ loginAccount.getUsername() + " logged out.";
        userService.updateJournal(loginAccount.getUsername(), loginOutString, currentDate, "#4472C4");
        model.addAttribute("loginAccount", null);
        session.invalidate();
        return "catalog/main";
    }

    @GetMapping("/viewRegister")
    public String viewRegister() {
        return "account/register";
    }

    @RequestMapping("/register")
    public String register(@ModelAttribute AccountVO accountVO,
                           @RequestParam("repeatPassword") String repeatPassword,
                           @RequestParam("captchaInput") String captchaInput,
                           Model model) {
        AccountVO loginAccount = (AccountVO) model.asMap().get("loginAccount");
        String captcha = (String) model.asMap().get("captcha");
        System.out.println(repeatPassword);
        if(!validate2(accountVO.getUsername(),accountVO.getPassword(),repeatPassword)){
            model.addAttribute("registerMsg", msg);
            return "account/register";
        }else if(!judgeCaptcha(captchaInput,captcha)){
            model.addAttribute("registerMsg", msg);
            return "account/register";
        } else{
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
            String currentDate = formatter.format(date);
            String registerString = "User "+ accountVO.getUsername() + " completed registration.";
            accountVO.setStatus("OK");
            userService.updateJournal(accountVO.getUsername(), registerString, currentDate, "#C00000");
            userService.insertAccount(accountVO);
            return "catalog/main";
        }
    }

    @GetMapping("/forgetPassword")
    public String forgetPassword(@RequestParam("userId") String userId)
    {
        System.out.println(userId);
        Signon signon = userService.getSignonByUsername(userId);
        String resetMessage;
        if(signon == null)
        {
            //用户不存在，返回注册页面并显示错误消息
            System.out.println("111");
            resetMessage = "User does not exist!";
        }
        else
        {
            System.out.println(signon.getUsername());
            ResetPassword check = userService.getResetPasswordByUserId(userId);
            if(check == null) {
                ResetPassword resetPassword = new ResetPassword();
                resetPassword.setUserId(userId);
                resetPassword.setStatus(0);
                userService.addResetPassword(resetPassword);
            }
            else
            {
                check.setStatus(0);
                userService.updateResetPassword(check);
            }

            //返回注册页面并显示成功消息
            resetMessage = "You have submitted a password reset request. Please wait for the administrator's review.";
        }
        return "redirect:/user/returnResetResult?resetMessage=" + resetMessage;
    }

    @GetMapping("/returnResetResult")
    public String showSignonPage(String resetMessage, Model model)
    {
        System.out.println("2222");
        model.addAttribute("resetMessage", resetMessage);
        return "account/signon";
    }

    @GetMapping("/viewEdit")
    public String viewEdit(){
        return "account/edit";
    }

    @RequestMapping("/edit")
    public String editAccount(@ModelAttribute AccountVO accountVO,
                              @ModelAttribute("loginAccount") AccountVO loginAccount,
                              @ModelAttribute("repeatPassword") String repeatPassword,
                              Model model) {
        accountVO.setUsername(loginAccount.getUsername());
        if(!validate2(accountVO.getUsername(),accountVO.getPassword(),repeatPassword)){
            model.addAttribute("editMsg", msg);
            return "account/edit";
        }else{
            accountVO.setStatus("OK");
            System.out.println(accountVO);
            userService.updateAccount(accountVO);
            AccountVO loginAccountVO = userService.getAccountVOByUsername(loginAccount.getUsername());
            model.addAttribute("loginAccount", loginAccountVO);
            return "account/edit";
        }
    }

    @GetMapping("/examination")
    @ResponseBody
    public String examination(@RequestParam("username") String username){
        Signon signon = userService.getSignonByUsername(username);
        if(signon == null||signon.getUsername()==null){
            return "";
        }else {
            return "true";
        }
    }

    @GetMapping("/viewJournal")
    public String viewJournal(@ModelAttribute("loginAccount") AccountVO loginAccount,
                              Model model) {
        List<Journal> journals = userService.getAllJournals(loginAccount.getUsername());
        model.addAttribute("journals", journals);
        return "Journal/journal.html";
    }

    @GetMapping("/getCaptcha")
    public void getCaptcha(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException, IOException {
        // 设置图片的宽度和高度
        int width = 120;
        int height = 30;
        int codeCount = 6;

        // 设置响应内容类型为图片
        response.setContentType("image/jpeg");

        // 创建一个 BufferedImage 对象
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = bufferedImage.createGraphics();

        // 设置背景色
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, width, height);

        // 设置字体
        Font font = new Font("Fixedsys", Font.BOLD, 20);
        g.setFont(font);

        Random random = new Random();

        // 添加干扰线
        for (int i = 0; i < 20; i++) {
            int xs = random.nextInt(width);
            int ys = random.nextInt(height);
            int xe = xs + random.nextInt(width / 8);
            int ye = ys + random.nextInt(height / 8);
            g.setColor(getRandomColor(160, 200));
            g.drawLine(xs, ys, xe, ye);
        }

        // 定义验证码字符集
        String code = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        StringBuilder captchaCode = new StringBuilder();

        // 随机生成验证码字符并绘制到图片上
        for (int i = 0; i < codeCount; i++) {
            int index = random.nextInt(code.length());
            char strRand = code.charAt(index);
            g.setColor(getRandomColor(80, 160));
            g.drawString(String.valueOf(strRand), 15 * i + 6, 24);
            captchaCode.append(strRand);
        }

        // 释放资源
        g.dispose();

        // 将验证码保存到 session 中
        model.addAttribute("captcha", captchaCode.toString());

        // 输出图片到响应流
        OutputStream out = response.getOutputStream();
        ImageIO.write(bufferedImage, "jpg", out);
        out.flush();
        out.close();
    }


    private boolean validate1(String username, String password){
        if (username == null || username.equals("")) {
            this.msg="用户名不能为空";
            return false;
        }
        if (password == null || password.equals("")) {
            this.msg="密码不能为空";
            return false;
        }
        //其他校验
        return true;
    }
    private boolean validate2(String username, String password,String repeatPassword){
        if (username == null || username.equals("")) {
            this.msg="用户名不能为空";
            return false;
        }
        if (password == null || password.equals("")) {
            this.msg="密码不能为空";
            return false;
        }
        if(!password.equals(repeatPassword)){
            System.out.println(password+"  "+repeatPassword);
            this.msg="两次密码不一致";
            return false;
        }
        //其他校验
        return true;
    }
    private Color getRandomColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255) fc = 255;
        if (bc > 255) bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }
    private boolean judgeCaptcha(String captchaInput, String captcha) {
        if(captchaInput==null || captchaInput.equals("")){
            this.msg="请输入验证码";
            return false;
        }
        else if(!captcha.equals(captchaInput)){
            this.msg="验证码不正确";
            return false;
        }
        return true;
    }
}
