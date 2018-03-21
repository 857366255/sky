package com.sky.admin.controller;

import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.po.Field;
import com.sky.admin.service.ConfigurationPageService;
import com.sky.admin.service.DatabaseService;
import com.sky.admin.service.FieldService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by wz on 2018/2/7.
 */
@Controller
@RequestMapping(value = "field")
public class FieldController {

    private static final String BASIC_PATH = "field";

    @Autowired
    private FieldService fieldService;

    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doData(Integer limit,Integer  page,Integer id){
        Field field =  new Field();
        field.setConfigurationpageId(id);
        System.out.println("limit = " + limit);
        System.out.println("page = " + page);
        Map<String,Object> mapData = fieldService.getParams(null,null,field);
        return mapData;
    }

}
