package com.sky.page.dao;

import com.sky.admin.po.EditField;
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
     * 新增数据
     * @param tableEn
     * @param editFields 数据
     * @return
     */
    public Boolean doAdd(@Param("tableEn")String tableEn,@Param("editFields")List<EditField> editFields);
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

    /**
     * 获得编辑字段
     * @param configurationPageCoding
     * @return
     */
    public List<EditField> getEditFields(String configurationPageCoding);

    /**
     * 查询列表数据
     * @param tableEn
     * @param listFields 查询显示字段
     * @param listFinds 查询字段 及 条件
     * @return
     */
    public List<Map<String,Object>> getListDatas(@Param("tableEn")String tableEn,@Param("listFields") List<ListField> listFields,@Param("listFinds") List<ListFind> listFinds);
}
