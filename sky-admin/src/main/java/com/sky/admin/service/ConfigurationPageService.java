package com.sky.admin.service;

import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.vo.EditField;
import com.sky.admin.vo.ListField;
import com.sky.admin.vo.QueryField;

import java.util.List;

/**
 * Created by wz on 2018/2/6.
 */
public interface ConfigurationPageService {

    List<EditField> getEditFields(String configurationPageCoding);
    List<ListField> getListFields(String configurationPageCoding);
    List<QueryField> getQueryFields(String configurationPageCoding);

    ConfigurationPage getConfiguration(String coding);
    List<ConfigurationPage> getConfigurationPages();

    Boolean doAdd(ConfigurationPage cp);
    Boolean doDelete(String coding);
    Boolean doUpdate(ConfigurationPage cp);
}
