package com.sky.admin.po;

import java.util.List;

/**
 * Created by wz on 2018/1/31.
 */
public class SelectBox {
    private String coding;//唯一标识符
    private String name;//名称
    private String tableEn;//数据库表名
    private String type;//类型
    private String valueFieldEn;//值的 数据库表字段
    private List<SelectBoxShowField> selectBoxShowFields;//下拉框显示字段
    private String customSelectboxGroup;//自定义下拉框分组
    //private List<Map> findList;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getValueFieldEn() {
        return valueFieldEn;
    }

    public void setValueFieldEn(String valueFieldEn) {
        this.valueFieldEn = valueFieldEn;
    }

    public List<SelectBoxShowField> getSelectBoxShowFields() {
        return selectBoxShowFields;
    }

    public void setSelectBoxShowFields(List<SelectBoxShowField> selectBoxShowFields) {
        this.selectBoxShowFields = selectBoxShowFields;
    }

    public String getCustomSelectboxGroup() {
        return customSelectboxGroup;
    }

    public void setCustomSelectboxGroup(String customSelectboxGroup) {
        this.customSelectboxGroup = customSelectboxGroup;
    }

    @Override
    public String toString() {
        return "SelectBox{" +
                "coding='" + coding + '\'' +
                ", name='" + name + '\'' +
                ", tableEn='" + tableEn + '\'' +
                ", type='" + type + '\'' +
                ", valueFieldEn='" + valueFieldEn + '\'' +
                ", selectBoxShowFields=" + selectBoxShowFields +
                ", customSelectboxGroup='" + customSelectboxGroup + '\'' +
                '}';
    }
}
