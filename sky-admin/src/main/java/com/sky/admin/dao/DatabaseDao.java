package com.sky.admin.dao;

import com.sky.admin.po.DatabaseTable;
import com.sky.admin.po.Field;

import java.util.List;

/**
 * Created by wz on 2018/3/17.
 */
public interface DatabaseDao {
    List<DatabaseTable> getDatabaseTable();
    List<Field> getDatabaseField(String tableEn);
}
