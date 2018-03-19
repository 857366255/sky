package com.sky.admin.service;

import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.po.Field;

import java.util.Map;

/**
 * Created by wz on 2018/2/6.
 */
public interface FieldService {

    Map<String,Object> getParams(Integer limit, Integer page, Field field);
    ConfigurationPage findById(Integer id);

    Boolean doAdd(Field field);
    Boolean doDelete(Integer id);
    Boolean doUpdate(Field field);
}
