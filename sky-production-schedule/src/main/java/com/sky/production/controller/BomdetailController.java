package com.sky.production.controller;

import com.sky.production.po.Bom;
import com.sky.production.po.BomDetail;
import com.sky.production.service.BomService;
import com.sky.production.service.BomdetailService;
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
@RequestMapping(value = "bomdetail")
public class BomdetailController {

    private static final String BASIC_PATH = "bomdetail";
    @Autowired
    private BomdetailService bomdetailService;
    @Autowired
    private SuppliesService suppliesService;
    @Autowired
    private BomService bomService;

    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(){
        return BASIC_PATH+"/list";
    }

    @RequestMapping(value = "/add",method= RequestMethod.GET)
    public String goAdd(Model model){
        model.addAttribute("bomdetail",new BomDetail());
        model.addAttribute("supplies",suppliesService.findAll());
        model.addAttribute("boms",bomService.findAll());
        return BASIC_PATH+"/edit";
    }

    @RequestMapping(value = "/edit",method= RequestMethod.POST)
    @ResponseBody
    public void doEditPOST(BomDetail bomdetail){
        if(bomdetailService.doAdd(bomdetail)){
            System.out.println("提交成功:"+bomdetail);
        }else {
            System.out.println("提交失败:"+bomdetail);
        }
    }
    @RequestMapping(value = "/edit/{id}",method= RequestMethod.GET)
    public String goEdit(Map<String, Object> map,@PathVariable Integer id){
        map.put("bomdetail",bomdetailService.findById(id));
        map.put("supplies",suppliesService.findAll());
        map.put("boms",bomService.findAll());
        return  BASIC_PATH+"/edit";
    }
    @RequestMapping(value = "/edit",method= RequestMethod.PUT)
    @ResponseBody
    public void doEditPUT(BomDetail bomdetail){
        if(bomdetailService.doUpdate(bomdetail)){
            System.out.println("修改成功:"+bomdetail);
        }else {
            System.out.println("修改失败:"+bomdetail);
        }
    }
    @RequestMapping(value={"del/{id}"},method=RequestMethod.DELETE)
    @ResponseBody
    public Boolean doDelete(@PathVariable Integer id){
        if(bomdetailService.doDelete(id)){
            System.out.println("删除成功");
            return true;
        }else{
            System.out.println("删除失败");
            return false;
        }
    }




    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doData(Integer limit, Integer  page, BomDetail bomdetail){
        System.out.println("limit = " + limit);
        System.out.println("page = " + page);
        Map<String,Object> mapData = bomdetailService.getParams(limit,page,bomdetail);
        System.out.println(bomdetail);
        return mapData;
    }
}
