package com.sky.admin.controller;

import com.sky.admin.dao.ConfigurationPageDao;
import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.po.DatabaseTable;
import com.sky.admin.service.ConfigurationPageService;
import com.sky.admin.service.DatabaseService;
import com.sky.admin.vo.ListField;
import com.sky.admin.vo.Params;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * Created by wz on 2018/2/7.
 */
@Controller
@RequestMapping(value = "configurationpage")
public class ConfigurationPageController {

    private static final String BASIC_PATH = "configurationpage";
    @Autowired
    private ConfigurationPageService configurationPageService;
    @Autowired
    private DatabaseService databaseService;

    @RequestMapping(value = "/index",method= RequestMethod.GET)
    public String goIndex(){
        return "index";
    }
    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(Model model){
        return BASIC_PATH+"/list";
    }
    @RequestMapping(value = "/add",method= RequestMethod.GET)
    public String goAdd(Model model){
        model.addAttribute("configurationpage",new ConfigurationPage());
        model.addAttribute("databaseTables",databaseService.getDatabaseTable());
        return BASIC_PATH+"/edit";
    }
    @RequestMapping(value = "/edit/{id}",method= RequestMethod.GET)
    public String goEdit(Map<String, Object> map,@PathVariable Integer id){
        map.put("configurationpage",configurationPageService.findById(id));
        map.put("databaseTables",databaseService.getDatabaseTable());
        return  BASIC_PATH+"/edit";
    }
    @RequestMapping(value = "/editDetail/{id}",method= RequestMethod.GET)
    public String goEditDetail(Model model,@PathVariable Integer id){
        model.addAttribute("configurationpage",configurationPageService.findById(id));
        model.addAttribute("databaseTables",databaseService.getDatabaseTable());
        return  BASIC_PATH+"/editDetail";
    }

    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public Map<String,Object> doData(Integer limit,Integer  page,ConfigurationPage configurationPage){
        System.out.println("limit = " + limit);
        System.out.println("page = " + page);
        Map<String,Object> mapData = configurationPageService.getParams(limit,page,configurationPage);
        return mapData;
    }

    @RequestMapping(value = "/edit",method= RequestMethod.POST)
    public void doEditPOST(Model model,ConfigurationPage configurationPage){
        if(configurationPageService.doAdd(configurationPage)){
            System.out.println("提交成功:"+configurationPage);
        }else {
            System.out.println("提交失败:"+configurationPage);
        }
        model.addAttribute("configurationpage", new ConfigurationPage());
    }
    @RequestMapping(value = "/edit",method= RequestMethod.PUT)
    public void doEditPUT(ConfigurationPage configurationPage){
        if(configurationPageService.doUpdate(configurationPage)){
            System.out.println("修改成功:"+configurationPage);
        }else {
            System.out.println("修改失败:"+configurationPage);
        }
    }
    @RequestMapping(value={"del/{id}"},method=RequestMethod.DELETE)
    @ResponseBody
    public Boolean delete(@PathVariable Integer id){
        if(configurationPageService.doDelete(id)){
            System.out.println("删除成功");
            return true;
        }else{
            System.out.println("删除失败");
            return false;
        }
    }


   /* @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String goList(Map<String, Object> map){
        return BASIC_PATH+"/list";
    }
    @RequestMapping(value = "/add",method= RequestMethod.GET)
    public String goAdd(Map<String, Object> map){
        map.put("type","add");
        return BASIC_PATH+"/edit";
    }
    @RequestMapping(value = "/update/{id}",method= RequestMethod.GET)
    public String goUpdate(Map<String, Object> map,@PathVariable String id){
        System.out.println(id);
        map.put("cp",configurationPageService.getConfiguration(id));
        map.put("type","update");
        return BASIC_PATH+"/edit";
    }
    @RequestMapping(value = "/detail/{id}",method= RequestMethod.GET)
    public String goDetail(Map<String, Object> map,@PathVariable String id){
        System.out.println(id);
        map.put("cp",configurationPageService.getConfiguration(id));
        return BASIC_PATH+"/detail";
    }

    *//**
     *获得数据
     *//*
    @RequestMapping(value="/data", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public List<ConfigurationPage> goData(Params params){
        return configurationPageService.getConfigurationPages();
    }

    *//**
     * 新增数据
     * @param configurationPage
     * @return
     *//*
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(Map<String, Object> map,ConfigurationPage configurationPage){
        System.out.println("新增");
        System.out.println(configurationPage);
        configurationPageService.doAdd(configurationPage);
        map.put("type","update");
        return "redirect:../update/"+configurationPage.getCoding();
    }
    *//**
     * 更新数据
     *//*
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
    *//**
     * 删除数据
     *//*
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

    @RequestMapping(value = "{type}/list/{id}",method= RequestMethod.GET)
    public String goFieldList(Map<String, Object> map,@PathVariable String type,@PathVariable String id){
        System.out.println(type);
        map.put("type",type);
        *//*Map<String,Object> listParams = getListParams(configurationPageCoding);
        map.put("listParams", JSON.toJSONString(listParams));*//*
        return BASIC_PATH+"/detail/list";
    }*/

    /*private Map<String, Object> getListParams(String configurationPageCoding) {
        Map<String,Object> listParams = new HashMap<String, Object>();
        listParams.put("url","../listData/"+configurationPageCoding);//请求后台的URL
        listParams.put("method","get");//请求方式
        listParams.put("pageNumber","1");//初始化加载第一页，默认第一页
        listParams.put("pageSize", "20");//每页的记录行数
        listParams.put("height","800");//每页的记录行数
        listParams.put("pageList", Arrays.asList("10", "25","50","100"));//可供选择的每页的行数
        listParams.put("uniqueId","coding");
        listParams.put("columns",getFieldParams(configurationPageCoding));
        return listParams;
    }

    private List<Map<String,Object>> getFieldParams(String configurationPageCoding){
        List<Map<String,Object>> filedParams = new ArrayList<Map<String, Object>>();
        List<ListField> listFields = pageDao.getListFields(configurationPageCoding);
        Map<String, Object> map;
        for(ListField listField : listFields){
            map = new HashMap<String, Object>();
            map.put("field",listField.getFieldEn());//列表字段标识符
            map.put("title",listField.getName());//列表字段名称
            filedParams.add(map);
        }
        map = new HashMap<String, Object>();
        map.put("field","operate");
        map.put("title","操作");
        map.put("events","operateEvents");
        map.put("formatter","operateFormatter");
        filedParams.add(map);
        return filedParams;
    }*/


}
