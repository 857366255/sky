package com.sky.production.controller;

import com.sky.production.po.DeviceCapacityDetail;
import com.sky.production.po.SuppliesProcess;
import com.sky.production.service.*;
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
@RequestMapping(value = "suppliesprocess")
public class SuppliesprocessController {

    private static final String BASIC_PATH = "suppliesprocess";
    @Autowired
    private SuppliesprocessService suppliesprocessService;
    @Autowired
    private SuppliesService suppliesService;
    @Autowired
    private SectionService sectionService;
    @Autowired
    private ProcessService processService;

    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(){
        return BASIC_PATH+"/list";
    }

    @RequestMapping(value = "/add",method= RequestMethod.GET)
    public String goAdd(Model model){
        model.addAttribute("suppliesprocess",new SuppliesProcess());
        model.addAttribute("suppliess",suppliesService.findAll());
        model.addAttribute("sections",sectionService.findAll());
        model.addAttribute("processs",processService.findAll());
        return BASIC_PATH+"/edit";
    }

    @RequestMapping(value = "/edit",method= RequestMethod.POST)
    @ResponseBody
    public void doEditPOST(SuppliesProcess suppliesprocess){
        if(suppliesprocessService.doAdd(suppliesprocess)){
            System.out.println("提交成功:"+suppliesprocess);
        }else {
            System.out.println("提交失败:"+suppliesprocess);
        }
    }
    @RequestMapping(value = "/edit/{id}",method= RequestMethod.GET)
    public String goEdit(Map<String, Object> map,@PathVariable Integer id){
        map.put("suppliesprocess",suppliesprocessService.findById(id));
        map.put("suppliess",suppliesService.findAll());
        map.put("sections",sectionService.findAll());
        map.put("processs",processService.findAll());
        return  BASIC_PATH+"/edit";
    }
    @RequestMapping(value = "/edit",method= RequestMethod.PUT)
    @ResponseBody
    public void doEditPUT(SuppliesProcess suppliesprocess){
        if(suppliesprocessService.doUpdate(suppliesprocess)){
            System.out.println("修改成功:"+suppliesprocess);
        }else {
            System.out.println("修改失败:"+suppliesprocess);
        }
    }
    @RequestMapping(value={"del/{id}"},method=RequestMethod.DELETE)
    @ResponseBody
    public Boolean doDelete(@PathVariable Integer id){
        if(suppliesprocessService.doDelete(id)){
            System.out.println("删除成功");
            return true;
        }else{
            System.out.println("删除失败");
            return false;
        }
    }




    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doData(Integer limit, Integer  page, SuppliesProcess devicecapacitydetail){
        System.out.println("limit = " + limit);
        System.out.println("page = " + page);
        Map<String,Object> mapData = suppliesprocessService.getParams(limit,page,devicecapacitydetail);
        System.out.println(devicecapacitydetail);
        return mapData;
    }
}
