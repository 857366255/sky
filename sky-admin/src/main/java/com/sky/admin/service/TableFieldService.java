package com.sky.admin.service;


import com.sky.admin.po.TableField;
import com.sky.common.base.BaseService;

import java.util.Map;


/**
 * Created by wz on 2018/2/6.
 */
public interface TableFieldService  extends BaseService<Integer,TableField> {
    Boolean updateTableField();
    Map<String,Object> getTableParams(Integer limit, Integer page, TableField tableField);
    Boolean doUpdateTableField(Map<String,Object> map);
}
