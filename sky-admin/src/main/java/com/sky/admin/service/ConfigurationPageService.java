package com.sky.admin.service;

import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.vo.EditField;
import com.sky.admin.vo.ListField;
import com.sky.admin.vo.QueryField;

import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/2/6.
 */
public interface ConfigurationPageService {

    Map<String,Object> getParams(Integer limit, Integer  page, ConfigurationPage configurationPage);
    ConfigurationPage findById(Integer id);

    Boolean doAdd(ConfigurationPage cp);
    Boolean doDelete(Integer coding);
    Boolean doUpdate(ConfigurationPage cp);
    Boolean doUpdateConfigurationPage(Map<String,Object> map);
    Boolean doDeleteConfigurationPage(Integer id);
}
