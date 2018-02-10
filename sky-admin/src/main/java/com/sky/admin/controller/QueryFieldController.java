package com.sky.admin.controller;

import com.sky.admin.dao.FieldDao;
import com.sky.admin.service.ConfigurationPageService;
import com.sky.admin.vo.QueryField;
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
@RequestMapping(value = "queryField")
public class QueryFieldController {

    @Autowired
    private ConfigurationPageService configurationPageService;
    @Autowired
    private FieldDao fieldDao;

    private final String V = "queryField";

    @RequestMapping(value = "/list/{id}",method= RequestMethod.GET)
    public String goList(Map<String, Object> map,@PathVariable String id){
        map.put("id",id);
        return V+"/list";
    }
    @RequestMapping(value = "/update/{id}",method= RequestMethod.GET)
    public String goUpdate(Map<String, Object> map,@PathVariable String id){
        System.out.println(id);
        map.put("qf",fieldDao.getQueryField(id));
        map.put("id",id);
        return V+"/edit";
    }
    /**
     *获得数据
     */
    @RequestMapping(value="/data/{id}", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public List<QueryField> goData(@PathVariable String id){
        List<QueryField> efs=configurationPageService.getQueryFields(id);
        return efs;
    }
    /**
     * 更新数据
     */
    @RequestMapping(value = "/update/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Boolean update(Map<String, Object> map, QueryField queryField, @PathVariable String id){
        queryField.setCoding(id);
        queryField.setQueryType(queryField.getQueryType().equals("") ? null : queryField.getQueryType());
        if(fieldDao.doUpdateQueryField(queryField)){
            System.out.println("更新成功");
            return true;
        } else{
            System.out.println("更新失败");
            return false;
        }
    }

}
