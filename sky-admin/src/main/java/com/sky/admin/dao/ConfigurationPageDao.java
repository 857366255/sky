package com.sky.admin.dao;

import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.po.Field;
import com.sky.admin.vo.Limit;
import com.sky.common.base.BaseDao;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by wz on 2018/2/5.
 */
public interface ConfigurationPageDao extends BaseDao<Integer ,ConfigurationPage> {
    ConfigurationPage getTableData(@Param("cp")ConfigurationPage cp);
    com.sky.admin.vo.ConfigurationPage getConfigurationPage(String coding);

    List<ConfigurationPage> findData(@Param("limit")Limit limit, @Param("configurationPage")ConfigurationPage configurationPage);
    Integer countData(@Param("configurationPage")ConfigurationPage configurationPage);
    Integer doAddGetId(ConfigurationPage configurationPage);
}
