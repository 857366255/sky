package com.sky.sys.po;

import java.util.List;

/**
 * Created by wz on 2017/12/15.
 * 表
 */
public class Table {
    /**
     *编码
     */
    private String coding;
    /**
     *名称
     */
    private String name;
    /**
     *配置页面编码
     */
    private String configurationPageCoding;
    /**
     *表
     */
    private String tableEn;
    /**
     *注释
     */
    private String annotation;
    /**
     *类型
     */
    private String type;
    /**
     *从表排序
     */
    private Integer slaveSorting;
    /**
     *上级编码
     */
    private String superiorCoding;
    /**
     *上级表关联字段
     */
    private String superiorCorrelateField;
    /**
     *关联字段
     */
    private String correlateField;
    /**
     * 字段信息
     */
    private List<Field> fieldList;

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

    public String getConfigurationPageCoding() {
        return configurationPageCoding;
    }

    public void setConfigurationPageCoding(String configurationPageCoding) {
        this.configurationPageCoding = configurationPageCoding;
    }

    public String getTableEn() {
        return tableEn;
    }

    public void setTableEn(String tableEn) {
        this.tableEn = tableEn;
    }

    public String getAnnotation() {
        return annotation;
    }

    public void setAnnotation(String annotation) {
        this.annotation = annotation;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getSlaveSorting() {
        return slaveSorting;
    }

    public void setSlaveSorting(Integer slaveSorting) {
        this.slaveSorting = slaveSorting;
    }

    public String getSuperiorCoding() {
        return superiorCoding;
    }

    public void setSuperiorCoding(String superiorCoding) {
        this.superiorCoding = superiorCoding;
    }

    public String getSuperiorCorrelateField() {
        return superiorCorrelateField;
    }

    public void setSuperiorCorrelateField(String superiorCorrelateField) {
        this.superiorCorrelateField = superiorCorrelateField;
    }

    public String getCorrelateField() {
        return correlateField;
    }

    public void setCorrelateField(String correlateField) {
        this.correlateField = correlateField;
    }

    public List<Field> getFieldList() {
        return fieldList;
    }

    public void setFieldList(List<Field> fieldList) {
        this.fieldList = fieldList;
    }

    @Override
    public String toString() {
        return "Table{" +
                "coding='" + coding + '\'' +
                ", name='" + name + '\'' +
                ", configurationPageCoding='" + configurationPageCoding + '\'' +
                ", tableEn='" + tableEn + '\'' +
                ", annotation='" + annotation + '\'' +
                ", type='" + type + '\'' +
                ", slaveSorting=" + slaveSorting +
                ", superiorCoding='" + superiorCoding + '\'' +
                ", superiorCorrelateField='" + superiorCorrelateField + '\'' +
                ", correlateField='" + correlateField + '\'' +
                ", fieldList=" + fieldList +
                '}';
    }
}
