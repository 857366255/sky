package com.sky.sys.po;

import java.util.*;

/**
 * Created by wz on 2017/10/14.
 */
public class GeneralPurpose {
    private String tableEn;//表名
    private String id;//唯一标示符名称
    private List<String> fieldList;//字段列表
    private List<Find> findList;//查询条件列表
    private Map<String,Object> createMap;//添加数据
    private Map<String,Object> updateMap;//更新数据列表

    public String getTableEn() {
        return tableEn;
    }

    public void setTableEn(String tableEn) {
        this.tableEn = tableEn;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<String> getFieldList() {
        return fieldList;
    }

    public void setFieldList(List<String> fieldList) {
        this.fieldList = fieldList;
    }

    public List<Find> getFindList() {
        return findList;
    }

    public void setFindList(List<Find> findList) {
        this.findList = findList;
    }

    public Map<String, Object> getCreateMap() {
        return createMap;
    }

    public void setCreateMap(Map<String, Object> createMap) {
        this.createMap = createMap;
    }

    public Map<String, Object> getUpdateMap() {
        return updateMap;
    }

    public void setUpdateMap(Map<String, Object> updateMap) {
        this.updateMap = updateMap;
    }
}
