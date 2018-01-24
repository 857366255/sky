package com.sky.sys.web;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.*;

/**
 * Created by Administrator on 2017/12/30.
 */
@Controller
public class TestController {


    @RequestMapping(value = "list",method= RequestMethod.GET)
    public String goList(Map<String, Object> map){
        Map<String,Object> listParams = getListParams("");
        map.put("listParams", JSON.toJSONString(listParams));
        return "test/list";
    }

    private Map<String, Object> getListParams(String configurationPageCoding) {
        Map<String,Object> listParams = new HashMap<String, Object>();
        listParams.put("url","/"+configurationPageCoding);//请求后台的URL
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
        //List<Map<String,Object>> listShowField = getListShowField(configurationPageCoding);
        List<Map<String,Object>> listShowField = new ArrayList<Map<String, Object>>();
        List<Map<String,Object>> filedParams = new ArrayList<Map<String, Object>>();



        Map<String, Object> map = new HashMap<String, Object>();
        map.put("field","coding");
        map.put("title","唯一标示符");
        filedParams.add(map);

        map = new HashMap<String, Object>();
        map.put("field","table_en");
        map.put("title","数据库表名");
        filedParams.add(map);

        map = new HashMap<String, Object>();
        map.put("field","filed_en");
        map.put("title","数据库字段名称");
        filedParams.add(map);
        map = new HashMap<String, Object>();
        map.put("field","name");
        map.put("title","名称");
        filedParams.add(map);
        map = new HashMap<String, Object>();
        map.put("field","is_show_list");
        map.put("title","是否显示列表");
        filedParams.add(map);

        map = new HashMap<String, Object>();
        map.put("field","operate");
        map.put("title","操作");
        map.put("events","operateEvents");
        map.put("formatter","operateFormatter");
        filedParams.add(map);
        return filedParams;
    }
}
