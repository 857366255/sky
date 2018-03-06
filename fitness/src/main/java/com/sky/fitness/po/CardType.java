package com.sky.fitness.po;

/**
 * Created by wz on 2018/3/6.
 */
public class CardType {
    private Integer id;//唯一标识符
    private String name;//名称
    private Integer month;//几月

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

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    @Override
    public String toString() {
        return "CardType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", month=" + month +
                '}';
    }
}
