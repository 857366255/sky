package com.sky.sys.server.impl;

import com.sky.sys.dao.GeneralPurposeDao;
import com.sky.sys.po.Find;
import com.sky.sys.po.GeneralPurpose;
import com.sky.sys.server.BaseServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.ws.rs.GET;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 * Created by Administrator on 2017/12/30.
 */
@Service
public class BaseServerImpl implements BaseServer {

    @Autowired
    private GeneralPurposeDao generalPurposeDao;

    private Boolean isTree = false;//是否字段递归次数

    private Integer fewTimes = 0;//递归次数

    public List<Map<String,Object>> getTree(String configurationPageCoding){
        GeneralPurpose generalPurpose = new GeneralPurpose();
        generalPurpose.setTableEn("s_menu");
        generalPurpose.setId("coding");
        generalPurpose.setChildField("superior_coding");
        List<String> fieldList = new ArrayList<String>();
        fieldList.add("coding");
        fieldList.add("name");
        fieldList.add("superior_coding");
        generalPurpose.setFieldList(fieldList);
        List<Find> findList = new ArrayList<Find>();
        Find find = new Find();
        find.setField("superior_coding");
        find.setType("is_null");
        findList.add(find);
        generalPurpose.setFindList(findList);
        List<Map<String,Object>> mapList = generalPurposeDao.findByCondition(generalPurpose);
        tree(mapList,generalPurpose);
        System.out.println(mapList);
        return mapList;
    }
    public List<Map<String, Object>> getTree(String configurationPageCoding, Integer fewTimes) {
        this.fewTimes = fewTimes;
        this.isTree = true;
        return getTree(configurationPageCoding);
    }

    private GeneralPurpose getGeneralPurpose(String configurationPageCoding){
        GeneralPurpose generalPurpose = new GeneralPurpose();
        List<Find> findList = new ArrayList<Find>();
        generalPurpose.setTableEn(getTableEn(configurationPageCoding));
        //generalPurpose.setId(getTableEn(configurationPageCoding));//s_table 表中 table_id 数据库字段还没添加
        //generalPurpose.setChildField(getChildField); // 创建一张表 s_fk  添加字段(coding,configuration_page_coding,本表表名,本表字段名称,引用表表名,引用字段名称)
        generalPurpose.setFieldList(getListField(configurationPageCoding,findList));
        return generalPurpose;
    }
    /**
     * 获得 树形结构 关联字段
     * @param configurationPageCoding
     * @return 关联字段
     */
    private String getChildField(String configurationPageCoding,String tableEn){

        return null;
    }

    /**
     * 获得表名唯一标识符 id
     * @param configurationPageCoding
     * @param tableEn
     * @return
     */
    private String getTableId(String configurationPageCoding,String tableEn){
        GeneralPurpose gp = new GeneralPurpose("s_table","coding");
        List<String> fieldList = new ArrayList<String>();
        fieldList.add("table_id");
        gp.setFieldList(fieldList);
        List<Find> findList = new ArrayList<Find>();
        findList.add( new Find("configuration_page_coding",configurationPageCoding,"equal") );
        findList.add( new Find("table_en",tableEn,"equal") );
        List<Map<String,Object>> list = generalPurposeDao.findByCondition(gp);
        if(list==null || list.size()!=0){
            System.out.println("错误:表没有主键或者有多个");
            return null;
        }
        return list.get(0).get("table_id").toString();
    }
    /**
     * 获得表名称
     * @param configurationPageCoding
     * @return
     */
    private String getTableEn(String configurationPageCoding){
        GeneralPurpose gp = new GeneralPurpose("s_configuration_page","coding");
        List<String> fieldList = new ArrayList<String>();
        fieldList.add("table_en");
        gp.setFieldList(fieldList);
        gp.setFindId(configurationPageCoding);
        Map<String,Object> map = generalPurposeDao.findById(gp);
        return map.get("table_en").toString();
    }
    /**
     * 获得 字段列表
     * @param configurationPageCoding
     * @return
     */
    private List<String> getListField(String configurationPageCoding,List<Find> findList){
        List<String> list = new ArrayList<String>();
        GeneralPurpose gp = new GeneralPurpose("s_field","coding");
        List<String> fieldList = new ArrayList<String>();
        fieldList.add("field_en");
        gp.setFieldList(fieldList);
        //List<Find> findList = new ArrayList<Find>();
        findList.add( new Find("configuration_page_coding",configurationPageCoding,"equal") );
        gp.setFindList(findList);
        List<Map<String,Object>> mapList = generalPurposeDao.findByCondition(gp);
        for(Map<String,Object>map:mapList){
            list.add(map.get("field_en").toString());
        }
        return  list;
    }
    /**
     * 递归循环 查找树形结构的数据
     * @param mapList
     * @param generalPurpose
     */
    private void tree(List<Map<String,Object>> mapList, GeneralPurpose generalPurpose){
        if(isTree && fewTimes.equals(0)) return;
        if(isTree && fewTimes>0) fewTimes--;
        for(Map<String,Object> map:mapList){
            List<Find> findList = new ArrayList<Find>();
            Find find = new Find();
            find.setField(generalPurpose.getChildField());
            find.setValue(map.get(generalPurpose.getId()));
            find.setType("equal");
            findList.add(find);
            generalPurpose.setFindList(findList);
            List<Map<String,Object>> childMapList = generalPurposeDao.findByCondition(generalPurpose);
            if(childMapList==null || childMapList.size()==0) continue;
            tree(childMapList,generalPurpose);
            map.put("childMapList",childMapList);
        }

    }

}
