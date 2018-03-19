package com.sky.admin.dao;

import com.sky.admin.po.Field;
import com.sky.admin.vo.EditField;
import com.sky.admin.vo.Limit;
import com.sky.admin.vo.ListField;
import com.sky.admin.vo.QueryField;
import com.sky.common.base.BaseDao;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by wz on 2018/2/5.
 */
public interface FieldDao extends BaseDao<Integer ,Field> {
    List<Field> findData(@Param("limit")Limit limit, @Param("field")Field field);
    Integer countData(@Param("field")Field field);
}
