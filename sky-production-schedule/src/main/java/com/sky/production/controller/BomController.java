package com.sky.production.controller;

import com.sky.production.po.Bom;
import com.sky.production.po.Process;
import com.sky.production.po.Supplies;
import com.sky.production.service.BomService;
import com.sky.production.service.ProcessService;
import com.sky.production.service.SectionService;
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
@RequestMapping(value = "bom")
public class BomController {

    private static final String BASIC_PATH = "bom";
    @Autowired
    private BomService bomService;
    @Autowired
    private SuppliesService suppliesService;

    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(){
        return BASIC_PATH+"/list";
    }

    @RequestMapping(value = "/add",method= RequestMethod.GET)
    public String goAdd(Model model){
        model.addAttribute("bom",new Bom());
        model.addAttribute("supplies",suppliesService.findAll());
        return BASIC_PATH+"/edit";
    }

    @RequestMapping(value = "/edit",method= RequestMethod.POST)
    @ResponseBody
    public void doEditPOST(Bom process){
        if(bomService.doAdd(process)){
            System.out.println("提交成功:"+process);
        }else {
            System.out.println("提交失败:"+process);
        }
    }
    @RequestMapping(value = "/edit/{id}",method= RequestMethod.GET)
    public String goEdit(Map<String, Object> map,@PathVariable Integer id){
        map.put("bom",bomService.findById(id));
        map.put("supplies",suppliesService.findAll());
        return  BASIC_PATH+"/edit";
    }
    @RequestMapping(value = "/edit",method= RequestMethod.PUT)
    @ResponseBody
    public void doEditPUT(Bom bom){
        if(bomService.doUpdate(bom)){
            System.out.println("修改成功:"+bom);
        }else {
            System.out.println("修改失败:"+bom);
        }
    }
    @RequestMapping(value={"del/{id}"},method=RequestMethod.DELETE)
    @ResponseBody
    public Boolean doDelete(@PathVariable Integer id){
        if(bomService.doDelete(id)){
            System.out.println("删除成功");
            return true;
        }else{
            System.out.println("删除失败");
            return false;
        }
    }




    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doData(Integer limit, Integer  page, Bom bom){
        System.out.println("limit = " + limit);
        System.out.println("page = " + page);
        Map<String,Object> mapData = bomService.getParams(limit,page,bom);
        System.out.println(bom);
        return mapData;
    }
}
