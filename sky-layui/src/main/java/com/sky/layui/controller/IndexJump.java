package com.sky.layui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wz on 2018/3/12.
 */
@Controller
public class IndexJump {
    @RequestMapping(value = "/TestWeAdmin",method = RequestMethod.GET)
    public String goTestWeAdmin(){
        return "WeAdmin/test/index";
    }
    @RequestMapping(value = "/WeAdmin",method = RequestMethod.GET)
    public String goWeAdmin(){
        return "WeAdmin/index";
    }
    @RequestMapping(value = "/TestLayuicsm",method = RequestMethod.GET)
    public String goTestLayuicsm(){
        return "layuicsm/test/index";
    }
    @RequestMapping(value = "/layuicsm",method = RequestMethod.GET)
    public String goLayuicsm(){
        return "layuicsm/index";
    }
    @RequestMapping(value = "/layuiSky",method = RequestMethod.GET)
    public String goLayuiSky(){
        return "layuiSky/index";
    }

}
