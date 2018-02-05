package com.sky.admin.po;

/**
 * Created by wz on 2018/1/30.
 */
public class InputField {
    private String coding;//唯一标识符
    private String inputType;//输入框类型
    private String name;//名称
    private String tableEn;//数据库表名
    private String keyFieldEn;//显示内容
    private String valueFieldEn;//得到的值

    public String getCoding() {
        return coding;
    }

    public void setCoding(String coding) {
        this.coding = coding;
    }

    public String getInputType() {
        return inputType;
    }

    public void setInputType(String inputType) {
        this.inputType = inputType;
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

    public String getKeyFieldEn() {
        return keyFieldEn;
    }

    public void setKeyFieldEn(String keyFieldEn) {
        this.keyFieldEn = keyFieldEn;
    }

    public String getValueFieldEn() {
        return valueFieldEn;
    }

    public void setValueFieldEn(String valueFieldEn) {
        this.valueFieldEn = valueFieldEn;
    }

    @Override
    public String toString() {
        return "InputField{" +
                "coding='" + coding + '\'' +
                ", inputType='" + inputType + '\'' +
                ", name='" + name + '\'' +
                ", tableEn='" + tableEn + '\'' +
                ", keyFieldEn='" + keyFieldEn + '\'' +
                ", valueFieldEn='" + valueFieldEn + '\'' +
                '}';
    }
}
