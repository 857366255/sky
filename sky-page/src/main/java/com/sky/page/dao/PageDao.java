package com.sky.page.dao;

import com.sky.admin.po.ConfigurationPage;
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
     * 获得配置页面
     * @param configurationPageCoding
     * @return
     */
    public ConfigurationPage getConfigurationPage(String configurationPageCoding);
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
     * 查询列表数据(多数据)
     * @param tableEn
     * @param listFields 查询显示字段
     * @param listFinds 查询字段 及 条件
     * @return
     */
    public List<Map<String,Object>> getListDatas(@Param("tableEn")String tableEn,@Param("listFields") List<ListField> listFields,@Param("listFinds") List<ListFind> listFinds);

    /**
     * 查询编辑数据(单一数据 通过id查询)
     * @param tableEn
     * @param idMap
     * @param editFields
     * @return
     */
    public Map<String,Object> getEidtData(@Param("tableEn")String tableEn,@Param("idMap") Map<String,Object> idMap,@Param("editFields") List<EditField> editFields);

    /**
     * 新增数据
     * @param tableEn
     * @param editFields 数据
     * @return
     */
    public Boolean doAdd(@Param("tableEn")String tableEn,@Param("editFields")List<EditField> editFields);

    /**
     * 更新数据
     * @param tableEn
     * @param editFields
     * @param findMap
     * @return
     */
    public Boolean doUpdate(@Param("tableEn")String tableEn,@Param("editFields")List<EditField> editFields,@Param("findMap") Map<String,Object> findMap);
    /**
     * 删除数据
     * @param tableEn
     * @param findMap
     * @return
     */
    public Boolean doDelete(@Param("tableEn")String tableEn,@Param("findMap") Map<String,Object> findMap);


}
