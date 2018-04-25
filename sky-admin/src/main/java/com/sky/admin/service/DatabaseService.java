package com.sky.admin.service;

import com.sky.admin.po.DatabaseTable;
import com.sky.admin.po.Field;

import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/3/17.
 */
public interface DatabaseService {
    List<DatabaseTable> getDatabaseTable();
    List<Field> getDatabaseField(String tableEn);
    Map<String,Object> getDatabaseFieldMap(String tableEn);

}
