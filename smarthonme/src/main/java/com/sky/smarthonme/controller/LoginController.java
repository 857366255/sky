package com.sky.smarthonme.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



/**
 * Created by wz on 2018/2/7.
 */
@Controller
public class LoginController {

    @RequestMapping(value = "/index",method= RequestMethod.GET)
    public String goIndex(){
        return "index";
    }

}
