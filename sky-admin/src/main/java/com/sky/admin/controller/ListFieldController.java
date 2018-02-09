package com.sky.admin.controller;

import com.sky.admin.dao.FieldDao;
import com.sky.admin.service.ConfigurationPageService;
import com.sky.admin.vo.EditField;
import com.sky.admin.vo.ListField;
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
@RequestMapping(value = "listField")
public class ListFieldController {

    @Autowired
    private ConfigurationPageService configurationPageService;
    @Autowired
    private FieldDao fieldDao;

    private final String V = "listField";

    @RequestMapping(value = "/list/{id}",method= RequestMethod.GET)
    public String goList(Map<String, Object> map,@PathVariable String id){
        map.put("id",id);
        return V+"/list";
    }
    @RequestMapping(value = "/update/{id}",method= RequestMethod.GET)
    public String goUpdate(Map<String, Object> map,@PathVariable String id){
        System.out.println(id);
        map.put("ef",fieldDao.getListField(id));
        map.put("id",id);
        return V+"/edit";
    }
    /**
     *获得数据
     */
    @RequestMapping(value="/data/{id}", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public List<ListField> goData(@PathVariable String id){
        List<ListField> efs=configurationPageService.getListFields(id);
        return efs;
    }
    /**
     * 更新数据
     */
    @RequestMapping(value = "/update/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Boolean update(Map<String, Object> map, ListField listField, @PathVariable String id){
        listField.setCoding(id);
        if(fieldDao.doUpdateListField(listField)){
            System.out.println("更新成功");
            return true;
        } else{
            System.out.println("更新失败");
            return false;
        }
    }

}
