package com.sky.page.dao;


import com.sky.admin.po.SelectBox;
import com.sky.admin.po.SelectBoxShowField;
import com.sky.admin.po.SelectBoxValue;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/1/25.
 */
public interface SelectBoxDao {

    /**
     * 获得 下拉框需要显示的字段
     * @param selectBoxCoding
     * @return
     */
    public List<SelectBoxShowField> getSelectBoxShowFields(String selectBoxCoding);
    /**
     * 获得 下拉框
     * @param selectBoxCoding
     * @return
     */
    public SelectBox getSelectBox(String selectBoxCoding);

    /**
     * 获得下拉框 内容
     * @param selectBox
     * @return
     */
    public List<SelectBoxValue> getSelectBoxValues(@Param("selectBox")SelectBox selectBox);

}
