package com.sky.production.controller;

import com.sky.production.po.DeviceType;
import com.sky.production.service.DevicetypeService;
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
@RequestMapping(value = "devicetype")
public class DevicetypeestController {

    private static final String BASIC_PATH = "devicetype";
    @Autowired
    private DevicetypeService devicetypeService;

    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(){
        return BASIC_PATH+"/list";
    }

    @RequestMapping(value = "/add",method= RequestMethod.GET)
    public String goAdd(Model model){
        model.addAttribute("devicetype",new DeviceType());
        return BASIC_PATH+"/edit";
    }

    @RequestMapping(value = "/edit",method= RequestMethod.POST)
    @ResponseBody
    public void doEditPOST(DeviceType deviceType){
        if(devicetypeService.doAdd(deviceType)){
            System.out.println("提交成功:"+deviceType);
        }else {
            System.out.println("提交失败:"+deviceType);
        }
    }
    @RequestMapping(value = "/edit/{id}",method= RequestMethod.GET)
    public String goEdit(Map<String, Object> map,@PathVariable Integer id){
        map.put("devicetype",devicetypeService.findById(id));
        return  BASIC_PATH+"/edit";
    }
    @RequestMapping(value = "/edit",method= RequestMethod.PUT)
    @ResponseBody
    public void doEditPUT(DeviceType deviceType){
        if(devicetypeService.doUpdate(deviceType)){
            System.out.println("修改成功:"+deviceType);
        }else {
            System.out.println("修改失败:"+deviceType);
        }
    }
    @RequestMapping(value={"del/{id}"},method=RequestMethod.DELETE)
    @ResponseBody
    public Boolean doDelete(@PathVariable Integer id){
        if(devicetypeService.doDelete(id)){
            System.out.println("删除成功");
            return true;
        }else{
            System.out.println("删除失败");
            return false;
        }
    }




    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doData(Integer limit, Integer  page, DeviceType deviceType){
        System.out.println("limit = " + limit);
        System.out.println("page = " + page);
        Map<String,Object> mapData = devicetypeService.getParams(limit,page,deviceType);
        return mapData;
    }
}
