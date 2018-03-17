package com.sky.admin.service.impl;

import com.sky.admin.dao.ConfigurationPageDao;
import com.sky.admin.dao.DatabaseDao;
import com.sky.admin.dao.FieldDao;
import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.po.DatabaseTable;
import com.sky.admin.po.Field;
import com.sky.admin.service.ConfigurationPageService;
import com.sky.admin.service.DatabaseService;
import com.sky.admin.vo.EditField;
import com.sky.admin.vo.Limit;
import com.sky.admin.vo.ListField;
import com.sky.admin.vo.QueryField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
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
        return databaseDao.getDatabaseTable();
    }
}
