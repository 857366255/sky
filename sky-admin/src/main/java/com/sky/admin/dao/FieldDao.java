package com.sky.admin.dao;

import com.sky.admin.po.Field;
import com.sky.common.base.BaseDao;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by wz on 2018/2/5.
 */
public interface FieldDao extends BaseDao<String ,Field> {
    /**
     * 查询数据库表字段
     * @param tableEn
     * @return
     */
    List<Field> getTableFieldData(@Param("tableEn")String tableEn,@Param("configurationPageCoding")String configurationPageCoding);
}
