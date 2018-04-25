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
@RequestMapping(value = "tableRelevance")
public class TableRelevanceController {

    private static final String BASIC_PATH = "tableRelevance";
    @Autowired
    private TableRelevanceService tableRelevanceService;
    @Autowired
    private DatabaseService databaseService;
    @Autowired
    private TableService tableService;

    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(){
        return BASIC_PATH+"/list";
    }
    @RequestMapping(value = "/list/{id}",method= RequestMethod.GET)
    public String goListById(Model model,@PathVariable Integer id){
        System.out.println("goListById:"+id);
        model.addAttribute("tableid",id);
        return BASIC_PATH+"/list";
    }

    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doData(Integer limit, Integer  page, TableRelevance tableRelevance){
        System.out.println("tableRelevance:"+tableRelevance);
        Map<String,Object> mapData = tableRelevanceService.getParams(limit,page,tableRelevance);
        return mapData;
    }

    @RequestMapping(value = "/add",method= RequestMethod.GET)
    public String goAdd(Model model,TableRelevance tableRelevance){
        Integer tableid = tableRelevance.getTableid();
        Integer tableRelevanceid = tableRelevance.getTableRelevanceid();
        String name = null;
        Table table = new Table();
        if(tableid != null){
            table = tableService.findById(tableid);
            name = "tableRelevanceidFieldEns";
        }else if(tableRelevanceid != null){
            name = "tableidFieldEns";
            table = tableService.findById(tableRelevanceid);
        }
        if(name != null) model.addAttribute("name",databaseService.getDatabaseField(table.getTableEn()));
        model.addAttribute("databaseTables",databaseService.getDatabaseTable());
        model.addAttribute("databaseFields",databaseService.getDatabaseField("-1"));
        return BASIC_PATH+"/edit";
    }
    @RequestMapping(value = "/edit",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doEditPOST(TableRelevance tableRelevance){
        System.out.println("tableRelevance:"+tableRelevance);
        if(tableRelevanceService.doAdd(tableRelevance)){
            System.out.println("提交成功:"+tableRelevance);
        }else {
            System.out.println("提交失败:"+tableRelevance);
        }
        return  new HashMap<String, Object>();
    }
    @RequestMapping(value = "/edit/{id}",method= RequestMethod.GET)
    public String goEdit(Model model,@PathVariable Integer id){
        TableRelevance tableRelevance = tableRelevanceService.findById(id);
        model.addAttribute("tableRelevance",tableRelevance);
        model.addAttribute("databaseTables",databaseService.getDatabaseTable());
        model.addAttribute("databaseFields",databaseService.getDatabaseField(tableRelevance.getTableEn()));
        return  BASIC_PATH+"/edit";
    }
    @RequestMapping(value = "/edit",method= RequestMethod.PUT)
    @ResponseBody
    public void doEditPUT(TableRelevance tableRelevance){
        if(tableRelevanceService.doUpdate(tableRelevance)){
            System.out.println("修改成功:"+tableRelevance);
        }else {
            System.out.println("修改失败:"+tableRelevance);
        }
    }
    @RequestMapping(value={"del/{id}"},method=RequestMethod.DELETE)
    @ResponseBody
    public Boolean doDelete(@PathVariable Integer id){
        if(tableRelevanceService.doDelete(id)){
            System.out.println("删除成功");
            return true;
        }else{
            System.out.println("删除失败");
            return false;
        }
    }

}
