package com.sky.admin.service;

import com.sky.admin.po.DatabaseTable;

import java.util.List;

/**
 * Created by wz on 2018/3/17.
 */
public interface DatabaseService {
    List<DatabaseTable> getDatabaseTable();
}
