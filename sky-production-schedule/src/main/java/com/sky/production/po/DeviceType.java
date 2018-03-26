package com.sky.production.po;

/**
 * 设备类型
 * Created by wz on 2018/3/26.
 */
public class DeviceType {
    private Integer id;//唯一标识符
    private String name;//名称

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

    @Override
    public String toString() {
        return "DeviceType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
