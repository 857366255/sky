package com.sky.production.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wz on 2018/3/27.
 */
@Controller
public class TestController {

    @RequestMapping(value = "index",method= RequestMethod.GET)
    public String goIndex(){
        return "index";
    }
}
