package com.sky.sys.dao;


import com.sky.sys.po.GeneralPurpose;

import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2017/10/9.
 */
public interface GeneralPurposeDao {

    /**
     * 查询唯一数据
     * @param generalPurpose
     * @return
     */
    public Map<String,Object> findById(GeneralPurpose generalPurpose);
    /**
     * 查询数据
     * @param generalPurpose
     * @return
     */
    public List<Map<String,Object>> findByCondition(GeneralPurpose generalPurpose);
    /**
     * 新增数据
     * @param generalPurpose
     * @return
     */
    public Boolean doCreate(GeneralPurpose generalPurpose);
    /**
     * 更新数据
     * @param generalPurpose
     * @return
     */
    public Boolean doUpdate(GeneralPurpose generalPurpose);
    /**
     * 删除数据
     * @param generalPurpose
     * @return
     */
    public Boolean doRemove(GeneralPurpose generalPurpose);


    //public Boolean doCreate(GeneralPurpose generalPurpose);
   // public boolean doRemoveBatch(GeneralPurpose generalPurpose);
   // public boolean doRemove(GeneralPurpose generalPurpose);
   // public boolean doUpdate(GeneralPurpose generalPurpose);
   // public List<Map<String,Object>> findAll(GeneralPurpose generalPurpose);
   // public Map<String,Object> findById(GeneralPurpose generalPurpose);
   // public List<Map<String,Object>> findByCondition(GeneralPurpose generalPurpose);

    /**
     * 通过表名称查找字段信息
     * @param generalPurpose
     * @return
     */
  //  public List<Map<String,Object>> findFieldByTableName(GeneralPurpose generalPurpose);

   // public List<Map<String,Object>> findFkFieldByTableName(GeneralPurpose generalPurpose);

    /**
     * 获得数据库字段信息
     * @return
     */
    public List<Map<String,Object>> getDatabaseField();
    /**
     * 获得数据库表信息
     * @return
     */
    public List<Map<String,Object>> getDatabaseTable();

    /**
     * 获得数据库外键字段
     * @return
     */
    public List<Map<String,Object>> getDatabaseFkField();


}
