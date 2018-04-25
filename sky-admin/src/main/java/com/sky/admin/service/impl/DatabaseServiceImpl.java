package com.sky.admin.service.impl;

import com.sky.admin.dao.DatabaseDao;
import com.sky.admin.po.DatabaseTable;
import com.sky.admin.po.Field;
import com.sky.admin.service.DatabaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/2/6.
 */
@Service
public class DatabaseServiceImpl implements DatabaseService {

    @Autowired
    private DatabaseDao databaseDao;

    public List<DatabaseTable> getDatabaseTable() {
        List<DatabaseTable> list = databaseDao.getDatabaseTable();
        list.add(0,new DatabaseTable());
        return list;
    }
    public List<Field> getDatabaseField(String tableEn) {
        List<Field> list = databaseDao.getDatabaseField(tableEn);
        list.add(0,new Field());
        return list;
    }
    public Map<String,Object> getDatabaseFieldMap(String tableEn) {
        List<Field> list = databaseDao.getDatabaseField(tableEn);
        list.add(0,new Field());
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status","200");
        map.put("message","result");
        map.put("data",list);
        return map;
    }

}
