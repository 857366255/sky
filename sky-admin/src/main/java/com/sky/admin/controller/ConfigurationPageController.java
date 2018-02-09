package com.sky.admin.controller;

import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.service.ConfigurationPageService;
import com.sky.admin.vo.Params;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/2/7.
 */
@Controller
@RequestMapping(value = "configurationpage")
public class ConfigurationPageController {

    @Autowired
    private ConfigurationPageService configurationPageService;

    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(Map<String, Object> map){
        return "configurationpage/list";
    }
    @RequestMapping(value = "/add",method= RequestMethod.GET)
    public String goAdd(Map<String, Object> map){
        map.put("type","add");
        return "configurationpage/edit";
    }
    @RequestMapping(value = "/update/{id}",method= RequestMethod.GET)
    public String goUpdate(Map<String, Object> map,@PathVariable String id){
        System.out.println(id);
        map.put("cp",configurationPageService.getConfiguration(id));
        map.put("type","update");
        return "configurationpage/edit";
    }
    @RequestMapping(value = "/detail/{id}",method= RequestMethod.GET)
    public String goDetail(Map<String, Object> map,@PathVariable String id){
        System.out.println(id);
        map.put("cp",configurationPageService.getConfiguration(id));
        return "configurationpage/detail";
    }

    /**
     *获得数据
     */
    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public List<ConfigurationPage> goData(Params params){
        return configurationPageService.getConfigurationPages();
    }

    /**
     * 新增数据
     * @param configurationPage
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(Map<String, Object> map,ConfigurationPage configurationPage){
        System.out.println("新增");
        System.out.println(configurationPage);
        configurationPageService.doAdd(configurationPage);
        map.put("type","update");
        return "redirect:../update/"+configurationPage.getCoding();
    }
    /**
     * 更新数据
     */
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public Boolean update(Map<String, Object> map,ConfigurationPage configurationPage){
        System.out.println("更新");
        map.put("type","update");
        if(configurationPageService.doUpdate(configurationPage)){
            System.out.println("更新成功");
            return true;
        } else{
            System.out.println("更新失败");
            return false;
        }
    }
    /**
     * 删除数据
     */
    @RequestMapping(value={"delete/{id}"},method=RequestMethod.DELETE)
    @ResponseBody
    public Boolean delete(@PathVariable String id){
        System.out.println("删除");
        if(configurationPageService.doDelete(id)){
            System.out.println("删除成功");
            return true;
        }else{
            System.out.println("删除失败");
            return false;
        }
    }
}
