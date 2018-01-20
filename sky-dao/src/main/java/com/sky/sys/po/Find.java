package com.sky.sys.po;

/**
 * 查询类
 * Created by Administrator on 2018/1/17.
 */
public class Find {
    private String field;//查询字段
    private Object value;//查询内容
    private String type;//查询类型

    public Find() {
        super();
    }
    public Find(String field, Object value, String type) {
        this.field = field;
        this.value = value;
        this.type = type;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
