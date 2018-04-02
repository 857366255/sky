package com.sky.production.test;

/**
 * Created by wz on 2018/4/2.
 */
public class FromAndToType {
    private String id;
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
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
        return "FromAndToType{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
