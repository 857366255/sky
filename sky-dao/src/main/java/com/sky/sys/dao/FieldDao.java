package com.sky.sys.dao;

import com.sky.sys.po.Field;

import java.util.List;

/**
 * Created by Administrator on 2017/12/17.
 */
public interface FieldDao extends BaseDao<String, Field> {
    public List<Field> findByTableCoding(String coding);
    public List<Field> getFieldList(String coding);
    /**
     * 获得数据库表字段信息
     * @param tableEn 表名
     * @return
     */
    public List<Field> getDatabaseFieldList(String tableEn);
}
