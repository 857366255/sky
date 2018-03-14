package com.sky.layui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wz on 2018/3/12.
 */
@Controller
public class JayuiSkyJump {
    @RequestMapping(value = "/layuiSky/editList",method = RequestMethod.GET)
    public String goLayuiSkyList(){
        return "layuiSky/edit-list";
    }

    @RequestMapping(value = "/layuiSky/edit",method = RequestMethod.GET)
    public String goLayuiSkyEdit(){
        return "layuiSky/edit";
    }//

    @RequestMapping(value = "/layuiSky/editMasterSlave",method = RequestMethod.GET)
    public String goLayuiSkyEditMasterSlave(){
        return "layuiSky/edit-master-slave";
    }//

}
