package com.sky.demo.controller;


import com.sky.demo.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wz on 2018/4/26.
 */
@Controller
@RequestMapping(value = "basic")
public class BasicDemoController {
    @Autowired
    private MenuService menuService;

    private static String URL = "basic";

    @RequestMapping(value = "/button",method= RequestMethod.GET)
    public String goButton(){
        return URL+"/button";
    }
    @RequestMapping(value = "/form",method= RequestMethod.GET)
    public String goForm(){
        return URL+"/form";
    }
    @RequestMapping(value = "/tab",method= RequestMethod.GET)
    public String goTab(){
        return URL+"/tab";
    }
}
