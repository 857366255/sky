package com.sky.sys.dao;

import com.sky.sys.po.Field;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/17.
 */
public interface FieldDao extends BaseDao<String, Field> {
    public List<Field> findByTableCoding(String coding);

    /**
     * 获得列表字段
     *
     * @param coding
     * @return
     */
    public List<Field> getFieldList(String coding);

    /**
     * 获得编辑列表
     *
     * @param coding
     * @return
     */
    public List<Field> getEditFieldList(String coding);
    /**
     * 获得数据库表字段信息
     * @param tableEn 表名
     * @return
     */
    public List<Field> getDatabaseFieldList(String tableEn);

    /**
     * 获得全部数据
     * @return
     */
    public List<Map<String, Object>> findAllMap();
}
