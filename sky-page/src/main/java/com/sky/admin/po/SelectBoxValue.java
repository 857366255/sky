package com.sky.admin.po;

/**
 * Created by wz on 2018/1/31.
 */
public class SelectBoxValue {
    private String name;//显示内容
    private String value;//值
    private Boolean valueBoolean;//值 判断


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Boolean getValueBoolean() {
        return valueBoolean;
    }

    public void setValueBoolean(Boolean valueBoolean) {
        this.valueBoolean = valueBoolean;
    }

    @Override
    public String toString() {
        return "SelectBoxValue{" +
                "name='" + name + '\'' +
                ", value='" + value + '\'' +
                ", valueBoolean=" + valueBoolean +
                '}';
    }
}
