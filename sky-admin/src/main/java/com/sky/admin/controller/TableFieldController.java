package com.sky.admin.controller;

import com.sky.admin.po.TableField;
import com.sky.admin.service.TableFieldService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wz on 2018/2/7.
 */
@Controller
@RequestMapping(value = "tableField")
public class TableFieldController {

    private static final String BASIC_PATH = "tableField";

    @Autowired
    private TableFieldService tableFieldService;


    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(){
        return BASIC_PATH+"/list";
    }

    @RequestMapping(value = "/editList/{tableEn}",method= RequestMethod.GET)
    public String goEditList(Model model, @PathVariable String tableEn){
        model.addAttribute("tableEn",tableEn);
        return BASIC_PATH+"/editList";
    }

    @RequestMapping(value = "/edit",method= RequestMethod.PUT)
    @ResponseBody
    public Map<String,Object> doEditPUT(@RequestBody Map<String,Object> map){
        System.out.println("修改:"+map);
        if(tableFieldService.doUpdateTableField(map)){
            System.out.println("修改成功:"+map);
        }else {
            System.out.println("修改失败:"+map);
        }
        return new HashMap<String, Object>();
    }

    @RequestMapping(value = "/updateTableField",method= RequestMethod.PUT)
    @ResponseBody
    public Map<String,Object> updateTableField(){
        Map<String,Object> map = new HashMap<String, Object>();
        tableFieldService.updateTableField();
        return map;
    }

    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doData(Integer limit, Integer  page, TableField tableField){
        System.out.println("limit = " + limit);
        System.out.println("page = " + page);
        Map<String,Object> mapData = tableFieldService.getTableParams(limit,page,tableField);
        return mapData;
    }
    @RequestMapping(value="/editListData", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doEditListData(Integer limit, Integer  page, TableField tableField){
        System.out.println("tableField:"+tableField);
        System.out.println("limit = " + limit);
        System.out.println("page = " + page);
        Map<String,Object> mapData = tableFieldService.getParams(limit,page,tableField);
        return mapData;
    }

}
