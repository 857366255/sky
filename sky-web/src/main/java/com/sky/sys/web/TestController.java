package com.sky.sys.web;

import com.alibaba.fastjson.JSON;
import com.sdicons.json.mapper.MapperException;
import com.sky.admin.po.ListField;
import com.sky.admin.po.ListFind;
import com.sky.page.dao.PageDao;
import com.sky.sys.vo.Params;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * Created by Administrator on 2017/12/30.
 */
@Controller
public class TestController {

    @Autowired
    private PageDao listFieldDao;

    @RequestMapping(value = "edit",method= RequestMethod.GET)
    public String goEdit(Map<String, Object> map){

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
        List<ListFind> listFinds =  listFieldDao.getListFinds("1");
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
        CopyOnWriteArrayList<ListFind> listFinds = new CopyOnWriteArrayList<ListFind>(listFieldDao.getListFinds(configurationPageCoding));
        for (ListFind listFind : listFinds) {
            Object temp = findMap.get(listFind.getFieldEn());
            if(temp==null){//前台传入的查询条件为空时
                listFinds.remove(listFind);//删除多余查询条件
                continue;
            }
            listFind.setValue(temp);//添加查询值
        }

        System.out.println(listFinds);
        return listFieldDao.getListDatas("s_menu",listFieldDao.getListFields(configurationPageCoding),listFinds);
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
        List<ListField> listFields = listFieldDao.getListFields(configurationPageCoding);
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
}
