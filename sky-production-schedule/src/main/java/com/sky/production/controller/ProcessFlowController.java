package com.sky.production.controller;

import com.sky.production.po.Bom;
import com.sky.production.po.ProcessFlow;
import com.sky.production.service.BomService;
import com.sky.production.service.ProcessflowService;
import com.sky.production.service.SuppliesService;
import com.sky.production.test.FromAndToType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/3/27.
 */
@Controller
@RequestMapping(value = "processflow")
public class ProcessFlowController {

    private static final String BASIC_PATH = "processflow";
    @Autowired
    private ProcessflowService processflowService;
    @Autowired
    private SuppliesService suppliesService;

    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(){
        return BASIC_PATH+"/list";
    }

    @RequestMapping(value = "/add",method= RequestMethod.GET)
    public String goAdd(Model model){
        model.addAttribute("processflow",new ProcessFlow());
        model.addAttribute("supplies",suppliesService.findAll());
        model.addAttribute("fromandtotypes",fromAndToType());
        model.addAttribute("fromids",null);
        model.addAttribute("toids",null);
        return BASIC_PATH+"/edit";
    }

    @RequestMapping(value = "/edit",method= RequestMethod.POST)
    @ResponseBody
    public void doEditPOST(ProcessFlow processFlow){
        if(processflowService.doAdd(processFlow)){
            System.out.println("提交成功:"+processFlow);
        }else {
            System.out.println("提交失败:"+processFlow);
        }
    }
    @RequestMapping(value = "/edit/{id}",method= RequestMethod.GET)
    public String goEdit(Map<String, Object> map,@PathVariable Integer id){
        map.put("processflow",processflowService.findById(id));
        map.put("supplies",suppliesService.findAll());
        map.put("fromandtotypes",fromAndToType());
        return  BASIC_PATH+"/edit";
    }
    @RequestMapping(value = "/edit",method= RequestMethod.PUT)
    @ResponseBody
    public void doEditPUT(ProcessFlow bom){
        if(processflowService.doUpdate(bom)){
            System.out.println("修改成功:"+bom);
        }else {
            System.out.println("修改失败:"+bom);
        }
    }
    @RequestMapping(value={"del/{id}"},method=RequestMethod.DELETE)
    @ResponseBody
    public Boolean doDelete(@PathVariable Integer id){
        if(processflowService.doDelete(id)){
            System.out.println("删除成功");
            return true;
        }else{
            System.out.println("删除失败");
            return false;
        }
    }




    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doData(Integer limit, Integer  page, ProcessFlow processFlow){
        System.out.println("limit = " + limit);
        System.out.println("page = " + page);
        Map<String,Object> mapData = processflowService.getParams(limit,page,processFlow);
        System.out.println(processFlow);
        return mapData;
    }

    private List<FromAndToType> fromAndToType(){
        List<FromAndToType>  mapList = new ArrayList<FromAndToType>();
        mapList.add(new FromAndToType());
        FromAndToType fatt = new FromAndToType();
        fatt.setId("t_process");
        fatt.setName("t_process");
        mapList.add(fatt);
        fatt = new FromAndToType();
        fatt.setId("t_supplies");
        fatt.setName("t_supplies");
        mapList.add(fatt);
        return mapList;
    }

    @RequestMapping(value = "/select/{type}",method= RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> doSelect(@PathVariable String type){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status","200");
        map.put("message","result");
        map.put("data",suppliesService.findAll());
        return  map;
    }

}
