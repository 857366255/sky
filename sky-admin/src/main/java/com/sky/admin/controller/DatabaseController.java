package com.sky.admin.controller;

import com.sky.admin.service.DatabaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by wz on 2018/2/7.
 */
@Controller
@RequestMapping(value = "database")
public class DatabaseController {

    private static final String BASIC_PATH = "database";

    @Autowired
    private DatabaseService databaseService;

    @RequestMapping(value="/field", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doFieldNull(){
        return databaseService.getDatabaseFieldMap("-1");
    }
    @RequestMapping(value="/field/{tableEn}", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doField(@PathVariable String tableEn){
        return databaseService.getDatabaseFieldMap(tableEn);
    }


}
