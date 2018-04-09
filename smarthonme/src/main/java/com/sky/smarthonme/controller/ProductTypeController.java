package com.sky.smarthonme.controller;


import com.sky.smarthonme.po.ProductType;
import com.sky.smarthonme.service.ProductTypeService;
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
@RequestMapping(value = "producttype")
public class ProductTypeController {

    private static final String BASIC_PATH = "producttype";

    @Autowired
    private ProductTypeService productTypeService;

    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(){
        return BASIC_PATH+"/list";
    }


    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doData(Integer limit, Integer  page, ProductType productType){
        System.out.println("limit = " + limit);
        System.out.println("page = " + page);
        Map<String,Object> mapData = productTypeService.getParams(limit,page,productType);
        return mapData;
    }

    @RequestMapping(value = "/add",method= RequestMethod.GET)
    public String goAdd(Model model){
        model.addAttribute("productType",new ProductType());
        //model.addAttribute("databaseTables",productTypeService.getDatabaseTable());
        return BASIC_PATH+"/edit";
    }

    @RequestMapping(value = "/edit",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doEditPOST(Model model,ProductType productType){
        if(productTypeService.doAdd(productType)){
            System.out.println("提交成功:"+productType);
        }else {
            System.out.println("提交失败:"+productType);
        }
       return new HashMap<String, Object>();
    }
    @RequestMapping(value={"del/{id}"},method=RequestMethod.DELETE)
    @ResponseBody
    public Boolean doDelete(@PathVariable Integer id){
        if(productTypeService.doDelete(id)){
            System.out.println("删除成功");
            return true;
        }else{
            System.out.println("删除失败");
            return false;
        }
    }

    @RequestMapping(value = "/edit/{id}",method= RequestMethod.GET)
    public String goEdit(Map<String, Object> map,@PathVariable Integer id){
        map.put("productType",productTypeService.findById(id));
        return  BASIC_PATH+"/edit";
    }
    @RequestMapping(value = "/edit",method= RequestMethod.PUT)
    @ResponseBody
    public void doEditPUT(ProductType productType){
        if(productTypeService.doUpdate(productType)){
            System.out.println("修改成功:"+productType);
        }else {
            System.out.println("修改失败:"+productType);
        }
    }

}
