package com.sky.admin.vo;

import java.util.List;

/**
 * Created by wz on 2018/2/5.
 */
public class ConfigurationPage {

    private String coding;//唯一标识符
    private String name;//名称
    private String tableEn;//数据库表名
    private String pkFieldEn;//数据库表主键字段
    private List<EditField> editFields;//编辑字段信息;
    private List<ListField> listFields;//列表字段信息;
    private List<QueryField> queryFields;//查询字段信息;

    public String getCoding() {
        return coding;
    }

    public void setCoding(String coding) {
        this.coding = coding;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTableEn() {
        return tableEn;
    }

    public void setTableEn(String tableEn) {
        this.tableEn = tableEn;
    }

    public String getPkFieldEn() {
        return pkFieldEn;
    }

    public void setPkFieldEn(String pkFieldEn) {
        this.pkFieldEn = pkFieldEn;
    }

    public List<EditField> getEditFields() {
        return editFields;
    }

    public void setEditFields(List<EditField> editFields) {
        this.editFields = editFields;
    }

    public List<ListField> getListFields() {
        return listFields;
    }

    public void setListFields(List<ListField> listFields) {
        this.listFields = listFields;
    }

    public List<QueryField> getQueryFields() {
        return queryFields;
    }

    public void setQueryFields(List<QueryField> queryFields) {
        this.queryFields = queryFields;
    }

    @Override
    public String toString() {
        return "ConfigurationPage{" +
                "coding='" + coding + '\'' +
                ", name='" + name + '\'' +
                ", tableEn='" + tableEn + '\'' +
                ", pkFieldEn='" + pkFieldEn + '\'' +
                ", editFields=" + editFields +
                ", listFields=" + listFields +
                ", queryFields=" + queryFields +
                '}';
    }
}
