package com.sky.admin.po;

/**
 * Created by wz on 2018/2/5.
 */
public class ConfigurationPage {

    private String coding;//唯一标识符
    private String name;//名称
    private String tableEn;//数据库表名
    private String pkFieldEn;//数据库表主键字段

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

    @Override
    public String toString() {
        return "ConfigurationPage{" +
                "coding='" + coding + '\'' +
                ", name='" + name + '\'' +
                ", tableEn='" + tableEn + '\'' +
                ", pkFieldEn='" + pkFieldEn + '\'' +
                '}';
    }
}
