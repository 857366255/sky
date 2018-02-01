package com.sky.sys.web;



import com.sky.admin.po.Menu;
import com.sky.page.dao.MenuDao;
//import com.sky.sys.server.ConfigurationPageServer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/30.
 */
@Controller
public class MenuController {
    @Autowired
    private MenuDao menuDao;
    //@Autowired
    //private ConfigurationPageServer configurationPageServer;
    @RequestMapping(value = "admin",method= RequestMethod.GET)
    public String goAdmin(Map<String, Object> map){
        List<Menu> menuList = menuDao.findMenuList();
        map.put("menuList",menuList);
        map.put("number",0);
        return "sys/index";
    }
   /* @RequestMapping(value = "add",method= RequestMethod.GET)
    public String test(){
        ConfigurationPage configurationPage = new ConfigurationPage();
        configurationPage.setCoding("HWAS21123123");
        configurationPage.setListHeight(1000);
        configurationPage.setListRows(20);
        configurationPage.setName("坤");
        configurationPage.setQuerysStyle("assad");
        configurationPage.setShownQuerys(true);
        configurationPage.setSlaveHeight(500);
        configurationPage.setTableEn("s_asd");
        configurationPage.setSlaveRows(10);
        try {
            configurationPageServer.addConfigurationPageInformation(configurationPage);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "sys/index";
    }*/
}
