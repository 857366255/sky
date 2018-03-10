package com.sky.shiro.controller;

import com.sky.shiro.po.User;
import com.sky.shiro.service.ShiroService;
import com.sky.tool.Toastr;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.ShiroException;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017/10/10.
 */
@Controller
//@RequestMapping("/user")
public class loginController {
    @Autowired
    private ShiroService shiroService;
    private Logger logger = Logger.getLogger(loginController.class);
    /**
     * 验证登录
     * @param username
     * @param password
     * @param session
     * @return url
     */
    @RequestMapping(value = "/login")
    public String Login(String username, String password, HttpSession session, Model model){
       // System.out.println("asds");
        if(username==null){
            model.addAttribute("message", "账号不为空");
            return "login";
        }
        //主体,当前状态为没有认证的状态“未认证”
        Subject subject = SecurityUtils.getSubject();
        // 登录后存放进shiro token
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        User user;
        //登录方法（认证是否通过）
        //使用subject调用securityManager,安全管理器调用Realm
        try {
            //利用异常操作
            //需要开始调用到Realm中
            System.out.println("========================================");
            System.out.println("1、进入认证方法");
            subject.login(token);
            user = (User)subject.getPrincipal();
            session.setAttribute("user",subject);
            model.addAttribute("toastrTitle", "登录完成");
            model.addAttribute("toastrType", Toastr.TYPE_SUCCESS);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 hh:mm:ss");
            model.addAttribute("toastrMessage", sdf.format(new Date()));
            System.out.println("登录完成:"+user);
            //UnknownAccountException
        } catch (UnknownAccountException e) {
            model.addAttribute("toastrTitle", "账号密码不正确");
            model.addAttribute("toastrType", Toastr.TYPE_ERROR);
            System.out.println("账号密码不正确    ");
            return "login";
        } catch (ShiroException e){
            model.addAttribute("toastrTitle", "账号密码不正确");
            model.addAttribute("toastrType", Toastr.TYPE_ERROR);
            System.out.println("账号密码不正确    ");
            return "login";
        }
        System.out.println("登录完成");

        return "index";
    }

    @RequestMapping("/check")
    public String check(HttpSession session){

        Subject subject=(Subject)session.getAttribute("user");

        User user=(User)subject.getPrincipal();
        System.out.println(user.toString());
        return "permission";
    }

    @RequestMapping("/readName")
    public String readName(HttpSession session){

        return "name";
    }

    @RequestMapping("/readData")
    public String readData(){

        return "data";
    }


    @RequestMapping("/nopermission")
    public String noPermission(){
        return "error";
    }
}
