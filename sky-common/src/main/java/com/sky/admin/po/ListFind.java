package com.sky.admin.po;

/**
 * 查询类
 * Created by Administrator on 2018/1/17.
 */
public class ListFind {
    private String coding;
    private String fieldEn;//查询字段
    private Object value;//查询内容
    private String queryType;//查询类型

    public String getCoding() {
        return coding;
    }

    public void setCoding(String coding) {
        this.coding = coding;
    }

    public String getFieldEn() {
        return fieldEn;
    }

    public void setFieldEn(String fieldEn) {
        this.fieldEn = fieldEn;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public String getQueryType() {
        return queryType;
    }

    public void setQueryType(String queryType) {
        this.queryType = queryType;
    }

    @Override
    public String toString() {
        return "ListFind{" +
                "coding='" + coding + '\'' +
                ", fieldEn='" + fieldEn + '\'' +
                ", value=" + value +
                ", queryType='" + queryType + '\'' +
                '}';
    }
}
