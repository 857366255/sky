package com.sky.admin.po;

import java.util.List;

/**
 * Created by Administrator on 2018/1/28.
 */
public class EditField {
    private String coding;//唯一标示符
    private String name;//名称
    private String fieldEn;//数据库字段名称
    private String tableEn;//数据库表名
    private Boolean isEdit;//是否编辑
    private String inputType;//输入框类型
    private Object value;//编辑 值
   // private List<InputField> inputFields;
    private String selectBoxCoding;//选择框编码
    private SelectBox selectBox;
    private List<SelectBoxValue> selectBoxValues;//

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

    public String getFieldEn() {
        return fieldEn;
    }

    public void setFieldEn(String fieldEn) {
        this.fieldEn = fieldEn;
    }

    public String getTableEn() {
        return tableEn;
    }

    public void setTableEn(String tableEn) {
        this.tableEn = tableEn;
    }

    public Boolean getEdit() {
        return isEdit;
    }

    public void setEdit(Boolean edit) {
        isEdit = edit;
    }

    public String getInputType() {
        return inputType;
    }

    public void setInputType(String inputType) {
        this.inputType = inputType;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public String getSelectBoxCoding() {
        return selectBoxCoding;
    }

    public void setSelectBoxCoding(String selectBoxCoding) {
        this.selectBoxCoding = selectBoxCoding;
    }

    public SelectBox getSelectBox() {
        return selectBox;
    }

    public void setSelectBox(SelectBox selectBox) {
        this.selectBox = selectBox;
    }

    public List<SelectBoxValue> getSelectBoxValues() {
        return selectBoxValues;
    }

    public void setSelectBoxValues(List<SelectBoxValue> selectBoxValues) {
        this.selectBoxValues = selectBoxValues;
    }

    @Override
    public String toString() {
        return "EditField{" +
                "coding='" + coding + '\'' +
                ", name='" + name + '\'' +
                ", fieldEn='" + fieldEn + '\'' +
                ", tableEn='" + tableEn + '\'' +
                ", isEdit=" + isEdit +
                ", inputType='" + inputType + '\'' +
                ", value=" + value +
                ", selectBoxCoding='" + selectBoxCoding + '\'' +
                ", selectBox=" + selectBox +
                ", selectBoxValues=" + selectBoxValues +
                '}';
    }
}
