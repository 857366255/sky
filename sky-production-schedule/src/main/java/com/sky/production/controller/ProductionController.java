package com.sky.production.controller;

import com.sky.production.po.Bom;
import com.sky.production.po.Production;
import com.sky.production.service.BomService;
import com.sky.production.service.ProductionService;
import com.sky.production.service.SuppliesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by wz on 2018/3/27.
 */
@Controller
@RequestMapping(value = "production")
public class ProductionController {

    private static final String BASIC_PATH = "production";
    @Autowired
    private ProductionService productionService;
    @Autowired
    private SuppliesService suppliesService;

    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(){
        return BASIC_PATH+"/list";
    }

    @RequestMapping(value = "/add",method= RequestMethod.GET)
    public String goAdd(Model model){
        model.addAttribute("production",new Production());
        model.addAttribute("supplies",suppliesService.findAll());
        return BASIC_PATH+"/edit";
    }

    @RequestMapping(value = "/edit",method= RequestMethod.POST)
    @ResponseBody
    public void doEditPOST(Production production){
        if(productionService.doAdd(production)){
            System.out.println("提交成功:"+production);
        }else {
            System.out.println("提交失败:"+production);
        }
    }
    @RequestMapping(value = "/edit/{id}",method= RequestMethod.GET)
    public String goEdit(Map<String, Object> map,@PathVariable Integer id){
        map.put("production",productionService.findById(id));
        map.put("supplies",suppliesService.findAll());
        return  BASIC_PATH+"/edit";
    }
    @RequestMapping(value = "/edit",method= RequestMethod.PUT)
    @ResponseBody
    public void doEditPUT(Production bom){
        if(productionService.doUpdate(bom)){
            System.out.println("修改成功:"+bom);
        }else {
            System.out.println("修改失败:"+bom);
        }
    }
    @RequestMapping(value={"del/{id}"},method=RequestMethod.DELETE)
    @ResponseBody
    public Boolean doDelete(@PathVariable Integer id){
        if(productionService.doDelete(id)){
            System.out.println("删除成功");
            return true;
        }else{
            System.out.println("删除失败");
            return false;
        }
    }




    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doData(Integer limit, Integer  page, Production production){
        System.out.println("limit = " + limit);
        System.out.println("page = " + page);
        Map<String,Object> mapData = productionService.getParams(limit,page,production);
        System.out.println(production);
        return mapData;
    }
}
