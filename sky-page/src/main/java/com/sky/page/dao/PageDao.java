package com.sky.page.dao;

import com.sky.admin.po.ListField;

import java.util.List;

/**
 * Created by wz on 2018/1/25.
 */
public interface PageDao {
    public List<ListField> getListFields(String configurationPageCoding);
}
