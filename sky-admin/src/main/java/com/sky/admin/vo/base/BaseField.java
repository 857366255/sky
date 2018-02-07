package com.sky.admin.vo.base;

/**
 * 实体类:字段基础信息
 * Created by wz on 2018/2/5.
 */
public class BaseField {
    private String coding;//唯一标识符
    private String configurationPageCoding;//配置页面编码
    private String tableEn;//数据库表名
    private String fieldEn;//数据库字段名称
    private String name;//名称

    public String getCoding() {
        return coding;
    }

    public void setCoding(String coding) {
        this.coding = coding;
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

    public String getFieldEn() {
        return fieldEn;
    }

    public void setFieldEn(String fieldEn) {
        this.fieldEn = fieldEn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return  "coding='" + coding + '\'' +
                ", configurationPageCoding='" + configurationPageCoding + '\'' +
                ", tableEn='" + tableEn + '\'' +
                ", fieldEn='" + fieldEn + '\'' +
                ", name='" + name + '\'' +
                ",";
    }
}
