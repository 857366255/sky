package com.sky.admin.controller;

import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.service.ConfigurationPageService;
import com.sky.admin.vo.EditField;
import com.sky.admin.vo.Params;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/2/7.
 */
@Controller
public class FieldController {

    @Autowired
    private ConfigurationPageService configurationPageService;

    @RequestMapping(value = "editField/list/{id}",method= RequestMethod.GET)
    public String goList(Map<String, Object> map,@PathVariable String id){
        map.put("id",id);
        return "editField/list";
    }

    /**
     *获得数据
     */
    @RequestMapping(value="editField/data/{id}", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public List<EditField> goData(@PathVariable String id){
        System.out.println("sdsaddas");
        return configurationPageService.getEditFields(id);
    }


    /**
     * 更新数据
     */
    @RequestMapping(value = "editField/update",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody
    public Boolean update(Map<String, Object> map,ConfigurationPage configurationPage){
        System.out.println("更新asdsd");
        System.out.println(configurationPage);
        //map.put("type","update");
       /* if(configurationPageService.doUpdate(configurationPage)){
            System.out.println("更新成功");
            return true;
        } else{
            System.out.println("更新失败");
            return false;
        }*/
        return true;
    }

}
