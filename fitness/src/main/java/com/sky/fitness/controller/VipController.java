package com.sky.fitness.controller;

import com.sky.fitness.po.Card;
import com.sky.fitness.po.Vip;
import com.sky.fitness.vo.VipAndCard;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;


/**
 * Created by wz on 2018/3/6.
 */
@Controller
@RequestMapping("/vip")
public class VipController {

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String goAdd(Model model){
        return "fitness/vip";
    }
    /**
     * 添加
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(Model model, Vip vip, Card card, VipAndCard vipAndCard){

        System.out.println(vip);
        System.out.println(card);
        System.out.println(vipAndCard);
        return "fitness/vip";
    }
}
