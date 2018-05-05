package com.sky.demo.controller;

import com.sky.demo.po.Menu;
import com.sky.demo.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/4/26.
 */
@Controller
public class MenuController {
    @Autowired
    private MenuService menuService;
    @RequestMapping(value = "/index",method= RequestMethod.GET)
    public String goIndex(){
        return "index";
    }
    @RequestMapping(value="/menu", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public List<Menu> doMenu(){
        Map<String,Object> mapData = new HashMap<String, Object>();
        List<Menu> menus =  menuService.findMenus();
        return menus;
    }
}
