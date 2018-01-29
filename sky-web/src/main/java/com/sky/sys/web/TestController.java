package com.sky.sys.web;

import com.alibaba.fastjson.JSON;
import com.sdicons.json.mapper.MapperException;
import com.sky.admin.po.EditField;
import com.sky.admin.po.ListField;
import com.sky.admin.po.ListFind;
import com.sky.page.dao.PageDao;
import com.sky.sys.vo.Params;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * Created by Administrator on 2017/12/30.
 */
@Controller
public class TestController {

    @Autowired
    private PageDao pageDao;


    @RequestMapping(value = "add/{configurationPageCoding}",method= RequestMethod.POST)
    public String add(@RequestParam Map<String, Object> map, @PathVariable String configurationPageCoding){
        System.out.println("新增");
        if(doAdd(configurationPageCoding,map)){
            System.out.println("保存成功");
        }else{
            System.out.println("保存失败");
        }
        System.out.println(map);
        List<EditField> editFields =  pageDao.getEditFields(configurationPageCoding);
        map.put("editFields", editFields);
        map.put("configurationPageCoding", configurationPageCoding);
        map.put("type", "add");
        return "redirect:"+configurationPageCoding;
    }
    @RequestMapping(value = "update/{configurationPageCoding}",method= RequestMethod.POST)
    public String update(@RequestParam Map<String, Object> map, @PathVariable String configurationPageCoding){
        System.out.println("修改");
        System.out.println(map);
        List<EditField> editFields =  pageDao.getEditFields(configurationPageCoding);
        map.put("configurationPageCoding", configurationPageCoding);
        map.put("type", "update");
        map.put("editFields", editFields);
        return "redirect:../edit";
    }

    @RequestMapping(value = "add/{configurationPageCoding}",method= RequestMethod.GET)
    public String goAdd(Map<String, Object> map, @PathVariable String configurationPageCoding){
        List<EditField> editFields =  pageDao.getEditFields(configurationPageCoding);
        map.put("editFields", editFields);
        map.put("configurationPageCoding", configurationPageCoding);
        map.put("type", "add");
        return "test/edit";
    }
    @RequestMapping(value = "update/{configurationPageCoding}/{id}",method= RequestMethod.GET)
    public String goUpdate(@PathVariable String configurationPageCoding,@PathVariable Integer id, Map<String, Object> map){
        List<EditField> editFields =  pageDao.getEditFields(configurationPageCoding);
        map.put("editFields", editFields);
        map.put("configurationPageCoding", configurationPageCoding);
        map.put("type", "update");
        Map<String,Object> data =  new HashMap<String, Object>();
        data.put("coding","asd");
        map.put("data",data);
        // pageConfigurationService.getUpdateField(map,tableNameEn);
       // Map<String, Object> findMap = new HashMap<String, Object>();
       // findMap.put("id",id);
        //map.put("data",generalPurposeService.findById(findMap));
        return "test/edit";
    }
    /**
     * 打开列表页面
     * @param map
     * @return
     */
    @RequestMapping(value = "list",method= RequestMethod.GET)
    public String goList(Map<String, Object> map){
        Map<String,Object> listParams = getListParams("1");
        List<ListFind> listFinds =  pageDao.getListFinds("1");
        map.put("listParams", JSON.toJSONString(listParams));
        map.put("listFinds", listFinds);
        return "test/list";
    }
    /**
     *获得数据
     */
    @RequestMapping(value="listData/{configurationPageCoding}", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public List<Map<String, Object>> data(@PathVariable String configurationPageCoding, Params params) throws MapperException {
        System.out.println("获得数据:");
        System.out.println(params);
        return getListData(configurationPageCoding,  params.getQuery()==null ? null : params.getQuery());
    }

    private List<Map<String,Object>> getListData(String configurationPageCoding,Map<String,Object> findMap){
        if(findMap==null) findMap = new HashMap<String, Object>();
        configurationPageCoding="1";
        CopyOnWriteArrayList<ListFind> listFinds = new CopyOnWriteArrayList<ListFind>(pageDao.getListFinds(configurationPageCoding));
        for (ListFind listFind : listFinds) {
            Object temp = findMap.get(listFind.getFieldEn());
            if(temp==null){//前台传入的查询条件为空时
                listFinds.remove(listFind);//删除多余查询条件
                continue;
            }
            listFind.setValue(temp);//添加查询值
        }

        System.out.println(listFinds);
        return pageDao.getListDatas("s_menu",pageDao.getListFields(configurationPageCoding),listFinds);
    }

    private Map<String, Object> getListParams(String configurationPageCoding) {
        Map<String,Object> listParams = new HashMap<String, Object>();
        listParams.put("url","listData/"+configurationPageCoding);//请求后台的URL
        listParams.put("method","get");//请求方式
        listParams.put("pageNumber","1");//初始化加载第一页，默认第一页
        listParams.put("pageSize", "10");//每页的记录行数
        listParams.put("height","500");//每页的记录行数
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
        /*map = new HashMap<String, Object>();
        map.put("field","operate");
        map.put("title","操作");
        map.put("events","operateEvents");
        map.put("formatter","operateFormatter");
        filedParams.add(map);*/
        return filedParams;
    }
    private Boolean doAdd(String configurationPageCoding, Map<String,Object> dataMap){
        if(dataMap==null) dataMap = new HashMap<String, Object>();
        configurationPageCoding="1";
        System.out.println(dataMap);
        CopyOnWriteArrayList<EditField> editFields = new CopyOnWriteArrayList<EditField>(pageDao.getEditFields(configurationPageCoding));
        System.out.println(editFields);
        for (EditField editField : editFields) {
            Object temp = dataMap.get(editField.getFieldEn());
            if(temp==null){//前台传入的查询条件为空时
                editFields.remove(editField);//删除多余查询条件
                continue;
            }
            editField.setValue(temp);//添加查询值
        }
        System.out.println(editFields);
        if(pageDao.doAdd("s_menu",editFields)){
            return true;
        }else{
            return false;
        }
    }
}
