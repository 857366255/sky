package com.sky.production.controller;

import com.sky.production.po.DeviceType;
import com.sky.production.service.DevicetypeestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by wz on 2018/3/27.
 */
@Controller
@RequestMapping(value = "devicetype")
public class DevicetypeestController {

    private static final String BASIC_PATH = "devicetype";
    @Autowired
    private DevicetypeestService devicetypeestService;

    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(){
        return BASIC_PATH+"/list";
    }
    @RequestMapping(value = "/add",method= RequestMethod.GET)
    public String goAdd(Model model){
        model.addAttribute("name","xxxxx");
        return BASIC_PATH+"/edit";
    }

    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doData(Integer limit, Integer  page, DeviceType deviceType){
        System.out.println("limit = " + limit);
        System.out.println("page = " + page);
        Map<String,Object> mapData = devicetypeestService.getParams(limit,page,deviceType);
        return mapData;
    }
}
