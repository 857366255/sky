package com.sky.admin.service;

import com.sky.admin.po.ConfigurationPage;

/**
 * Created by wz on 2018/2/6.
 */
public interface ConfigurationPageService {
    Boolean doAdd(ConfigurationPage cp);
    Boolean doDelete(String coding);
}
