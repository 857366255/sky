package com.sky.admin.dao;

import com.sky.admin.po.TableField;
import com.sky.admin.vo.Limit;
import com.sky.common.base.BaseDao;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/2/5.
 */
public interface TableFieldDao extends BaseDao<Integer ,TableField> {

    List<TableField> getAddTableField();
    List<TableField> getDeleteTableField();
    List<Map<String,Object>> findTableData(@Param("limit")Limit limit, @Param("vo")TableField tableField);
    Integer countTableData(@Param("vo")TableField tableField);

}
