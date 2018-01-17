package com.sky.sys.web;

import com.alibaba.fastjson.JSON;
import com.sdicons.json.mapper.MapperException;
import com.sky.sys.po.Menu;
import com.sky.sys.server.ConfigurationPageServer;
import com.sky.sys.server.MenuServer;
import com.sky.sys.vo.Params;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/30.
 */
@Controller
@RequestMapping(value = "configuration")
public class ConfigurationPageController {
    @Autowired
    private ConfigurationPageServer configurationPageServer;
    @RequestMapping(value = "/list/{configurationPageCoding}",method= RequestMethod.GET)
    public String goList(Map<String, Object> map, @PathVariable String configurationPageCoding){
        Map<String,Object> listParams = configurationPageServer.getListParams(configurationPageCoding);
        map.put("listParams", JSON.toJSONString(listParams));
        return "sys/list";
    }

    @RequestMapping(value = "/edit/{configurationPageCoding}", method = RequestMethod.GET)
    public String goCreate(Map<String, Object> map, @PathVariable String configurationPageCoding) {
        Map<String, Object> editParams = configurationPageServer.getEditParams(configurationPageCoding);
        map.put("editParams", editParams);
        return "sys/edit";
    }


    /**
     *获得数据
     */
    @RequestMapping(value="data/{configurationPageCoding}", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public List<Map<String, Object>> data(@PathVariable String configurationPageCoding,Params params) throws MapperException {
        System.out.println("获得数据:");
        return configurationPageServer.getListData(configurationPageCoding,  params.getQuery()==null ? new HashMap<String, Object>() : params.getQuery());
    }
}
