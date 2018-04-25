package com.sky.admin.controller;


import com.sky.admin.po.Table;
import com.sky.admin.po.TableRelevance;
import com.sky.admin.service.DatabaseService;
import com.sky.admin.service.TableRelevanceService;
import com.sky.admin.service.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;


/**
 * Created by wz on 2018/2/7.
 */
@Controller
@RequestMapping(value = "table")
public class TableController {

    private static final String BASIC_PATH = "table";
    @Autowired
    private TableService tableService;
    @Autowired
    private DatabaseService databaseService;

    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(){
        return BASIC_PATH+"/list";
    }

    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doData(Integer limit, Integer  page, Table table){
        Map<String,Object> mapData = tableService.getParams(limit,page,table);
        return mapData;
    }

    @RequestMapping(value = "/add",method= RequestMethod.GET)
    public String goAdd(Model model){
        model.addAttribute("table",new Table());
        model.addAttribute("databaseTables",databaseService.getDatabaseTable());
        return BASIC_PATH+"/edit";
    }

    @RequestMapping(value = "/edit",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doEditPOST(Table table){
        if(tableService.doAdd(table)){
            System.out.println("提交成功:"+table);
        }else {
            System.out.println("提交失败:"+table);
        }
        return  new HashMap<String, Object>();
    }

    @RequestMapping(value = "/edit/{id}",method= RequestMethod.GET)
    public String goEdit(Model model,@PathVariable Integer id){
        System.out.println("asds");
        model.addAttribute("table",tableService.findById(id));
        model.addAttribute("databaseTables",databaseService.getDatabaseTable());
        return  BASIC_PATH+"/edit";
    }

    @RequestMapping(value = "/edit",method= RequestMethod.PUT)
    @ResponseBody
    public void doEditPUT(Table table){
        if(tableService.doUpdate(table)){
            System.out.println("修改成功:"+table);
        }else {
            System.out.println("修改失败:"+table);
        }
    }
    @RequestMapping(value={"del/{id}"},method=RequestMethod.DELETE)
    @ResponseBody
    public Boolean doDelete(@PathVariable Integer id){
        if(tableService.doDelete(id)){
            System.out.println("删除成功");
            return true;
        }else{
            System.out.println("删除失败");
            return false;
        }
    }


}
