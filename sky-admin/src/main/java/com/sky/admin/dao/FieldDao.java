package com.sky.admin.dao;

import com.sky.admin.po.Field;
import com.sky.admin.vo.EditField;
import com.sky.admin.vo.ListField;
import com.sky.admin.vo.QueryField;
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

    /**
     * 批量删除 符合configurationPageCoding条件的数据
     * @param configurationPageCoding
     * @return
     */
    Boolean doDeleteByConfigurationPageCoding(@Param("configurationPageCoding")String configurationPageCoding);

    List<EditField> getEditFields(String configurationPageCoding);
    List<ListField> getListFields(String configurationPageCoding);
    List<QueryField> getQueryFields(String configurationPageCoding);
}
