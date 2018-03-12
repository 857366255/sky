package com.sky.layui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wz on 2018/3/12.
 */
@Controller
public class WeAdminJump {
    @RequestMapping(value = "/TestWeAdmin/list",method = RequestMethod.GET)
    public String goTestWeAdmin(){
        return "WeAdmin/test/list";
    }
}

