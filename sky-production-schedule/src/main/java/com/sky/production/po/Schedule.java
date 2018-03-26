package com.sky.production.po;

/**
 * 日程安排
 * Created by wz on 2018/3/26.
 */
public class Schedule {
    private Integer id;//唯一标识符

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "id=" + id +
                '}';
    }
}
