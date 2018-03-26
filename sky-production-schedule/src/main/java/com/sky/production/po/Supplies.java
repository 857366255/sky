package com.sky.production.po;

/**
 * 物资
 * Created by wz on 2018/3/26.
 */
public class Supplies {
    private Integer id;//唯一标识符
    private String name;//名称
    private String type;//类型

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Supplies{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}
