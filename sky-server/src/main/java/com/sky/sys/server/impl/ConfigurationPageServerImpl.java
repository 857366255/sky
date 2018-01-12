package com.sky.sys.server.impl;

import com.sky.sys.dao.ConfigurationPageDao;
import com.sky.sys.dao.FieldDao;
import com.sky.sys.dao.MenuDao;
import com.sky.sys.dao.TableDao;
import com.sky.sys.po.ConfigurationPage;
import com.sky.sys.po.Field;
import com.sky.sys.po.Menu;
import com.sky.sys.po.Table;
import com.sky.sys.server.ConfigurationPageServer;
import com.sky.sys.server.MenuServer;
import com.sky.tool.UUIDTool;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Created by Administrator on 2017/12/30.
 */
@Service
public class ConfigurationPageServerImpl implements ConfigurationPageServer {

    @Autowired
    private ConfigurationPageDao configurationPageDao;
    @Autowired
    private TableDao tableDao;
    @Autowired
    private FieldDao fieldDao;

    public Map<String, Object> getListParams(String configurationPageCoding) {
        ConfigurationPage configurationPage=configurationPageDao.findById(configurationPageCoding);
        Map<String,Object> listParams = new HashMap<String, Object>();
        listParams.put("url","/"+"aa");//请求后台的URL
        listParams.put("method","get");//请求方式
        listParams.put("pageNumber","1");//初始化加载第一页，默认第一页
        listParams.put("pageSize", configurationPage.getListRows());//每页的记录行数
        listParams.put("height",configurationPage.getListHeight());//每页的记录行数
        listParams.put("pageList", Arrays.asList("10", "25","50","100"));//可供选择的每页的行数
        listParams.put("uniqueId","coding");
        listParams.put("columns",getFieldParams(configurationPage.getListFieldList()));
        return listParams;
    }
    @Transactional
    public Boolean addConfigurationPageInformation(ConfigurationPage configurationPage) {
        String coding = UUIDTool.getUUID();//获得唯一标示符
        configurationPage.setCoding(coding);//设置配置页面唯一标示符
        configurationPageDao.doCreate(configurationPage);//创建配置页面信息
        if(StringUtils.isEmpty(configurationPage.getTableEn())){//判断关联表是否为空
            return true;//为null 结束执行
        }
        String tableEn = configurationPage.getTableEn();
        Table table = tableDao.getDatabaseTable(tableEn);
        String tableCoding = UUIDTool.getUUID();//获得唯一标示符
        table.setCoding(tableCoding);//设置表唯一标示符
        table.setConfigurationPageCoding(coding);//设置配置页面编码
        table.setType("master");//设置该表为主表内容
        tableDao.doCreate(table);//创建主表信息
        List<Field> fieldList = fieldDao.getDatabaseFieldList(tableEn);//获得表字段信息列表
        for(Field field : fieldList){//遍历表字段信息列表
            String fieldCoding = UUIDTool.getUUID();//获得唯一标示符
            field.setCoding(fieldCoding);//设置表字段唯一标示符
            field.setTableCoding(tableCoding);//设置表编码
            field.setConfigurationPageCoding(coding);//设置配置页面编码
            fieldDao.doCreate(field);
        }


        System.out.println(configurationPage.getCoding());
        return null;
    }

    private List<Map<String,Object>> getFieldParams(List<Field> fieldList){
        List<Map<String,Object>> filedParams = new ArrayList<Map<String, Object>>();
        Map<String, Object> map = new HashMap<String, Object>();
        for(Field filed : fieldList){
            map = new HashMap<String, Object>();
            map.put("field",filed.getCoding());
            map.put("title",filed.getName());
            filedParams.add(map);
        }
        map = new HashMap<String, Object>();
        map.put("field","operate");
        map.put("title","操作");
        map.put("events","operateEvents");
        map.put("formatter","operateFormatter");
        filedParams.add(map);
        return filedParams;
    }
}
