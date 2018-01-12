package com.sky.sys.web;

import com.alibaba.fastjson.JSON;
import com.sky.sys.po.Menu;
import com.sky.sys.server.ConfigurationPageServer;
import com.sky.sys.server.MenuServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
}
