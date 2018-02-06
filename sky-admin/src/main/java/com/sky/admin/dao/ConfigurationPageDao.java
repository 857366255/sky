package com.sky.admin.dao;

import com.sky.admin.po.ConfigurationPage;
import com.sky.common.base.BaseDao;
import org.apache.ibatis.annotations.Param;

/**
 * Created by wz on 2018/2/5.
 */
public interface ConfigurationPageDao extends BaseDao<String ,ConfigurationPage> {
    ConfigurationPage getTableData(@Param("cp")ConfigurationPage cp);
}
