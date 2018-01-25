package com.sky.page.dao;

import com.sky.admin.po.ListField;
import com.sky.admin.po.ListFind;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/1/25.
 */
public interface PageDao {
    /**
     * 获得列表显示字段
     * @param configurationPageCoding
     * @return
     */
    public List<ListField> getListFields(String configurationPageCoding);
    /**
     * 获得列表查询字段
     * @param configurationPageCoding
     * @return
     */
    public List<ListFind> getListFinds(String configurationPageCoding);

    public List<Map<String,Object>> getListDatas(@Param("tableEn")String tableEn,@Param("listFields") List<ListField> listFields,@Param("listFinds") List<ListFind> listFinds);
}
