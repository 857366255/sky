package com.sky.sys.dao;

import com.sky.sys.po.Table;

import java.util.List;

/**
 * Created by Administrator on 2017/12/17.
 */
public interface TableDao extends BaseDao<String, Table> {
    /**
     *查询主表信息
     */
    public List<Table> findMasterTableList();

    /**
     * 查询配置页面表信息
     * @return
     */
    public List<Table> findByConfigurationPageCoding(String configurationPageCoding);

    /**
     * 获得数据库表信息
     * @param tableEn
     * @return
     */
    public Table getDatabaseTable(String tableEn);
}
