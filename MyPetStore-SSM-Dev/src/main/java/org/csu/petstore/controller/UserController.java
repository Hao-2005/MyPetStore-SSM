package org.csu.petstore.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Journal;
import org.csu.petstore.entity.Signon;
import org.csu.petstore.service.UserService;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;


@Controller
@RequestMapping("/user")
@SessionAttributes(value = {"loginAccount","captcha"})
public class UserController {

    private String msg;
    @Autowired
    private UserService userService;

    @GetMapping("/viewSignon")
    public String viewSignon() {
        return "account/signon";
    }
    
    @RequestMapping("/signon")
    public String signon(String username,
                         String password,
                         String captchaInput,
                         @ModelAttribute("captcha") String captcha,
                         Model model) {
        Account loginAccount = userService.getAccountByUsernameAndPssword(username, password);

        if(!validate1(username,password)){
            model.addAttribute("signOnMsg", msg);
            return "account/signon";
        }else if(!judgeCaptcha(captchaInput,captcha)){
            model.addAttribute("signOnMsg", msg);
            return "account/signon";
        } else{
            if(loginAccount == null) {
                msg = "用户名或密码错误";
                model.addAttribute("signOnMsg", msg);
                return "account/signon";
            }else {
                AccountVO loginAccountVO = userService.getAccountVOByUsername(username);
                model.addAttribute("loginAccount", loginAccountVO);
                return "catalog/main";
            }
        }
    }

    @GetMapping("/viewRegister")
    public String viewRegister() {
        return "account/register";
    }

    @RequestMapping("/register")
    public String register(@ModelAttribute AccountVO accountVO,
                           @ModelAttribute("captcha") String captcha,
                           Model model) {
        String repeatPassword = (String) model.getAttribute("repeatPassword");
        if(!validate2(accountVO.getUsername(),accountVO.getPassword(),repeatPassword)){
            model.addAttribute("registerMsg", msg);
            return "account/register";
        }else if(!judgeCaptcha((String) model.getAttribute("captchaInput"),captcha)){
            model.addAttribute("registerMsg", msg);
            return "account/register";
        } else{
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
            String currentDate = formatter.format(date);
            String registerString = "User "+ accountVO.getUsername() + " completed registration.";
            userService.updateJournal(accountVO.getUsername(), registerString, currentDate, "#C00000");
            userService.insertAccount(accountVO);
            return "account/main";
        }
    }

    @GetMapping("/viewEdit")
    public String viewEdit(){
        return "user/edit";
    }

    @RequestMapping("/editAccount")
    public String editAccount(@ModelAttribute AccountVO accountVO,
                              @ModelAttribute("loginAccount") AccountVO loginAccount,
                              Model model) {
        String repeatPassword = (String) model.getAttribute("repeatPassword");
        if(!validate2(accountVO.getUsername(),accountVO.getPassword(),repeatPassword)){
            model.addAttribute("editAccountMsg", msg);
            return "account/edit";
        }else{
            userService.updateAccount(accountVO);
            AccountVO loginAccountVO = userService.getAccountVOByUsername(loginAccount.getUsername());
            model.addAttribute("loginAccount", loginAccountVO);
            return "account/edit";
        }
    }
    @GetMapping("/examination")
    @ResponseBody
    public String examination(String username){
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
        return "Journal/journal";
    }

    @GetMapping("/getCaptcha")
    public void getCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException, IOException {
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
        HttpSession session = request.getSession();
        session.setAttribute("captcha", captchaCode.toString());

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
