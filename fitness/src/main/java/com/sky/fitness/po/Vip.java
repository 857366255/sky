package com.sky.fitness.po;

/**
 * Created by wz on 2018/3/6.
 */
public class Vip {

    private Integer id;//唯一标识符
    private String name;//名称
    private String contact;//类型方式
    private Integer userId;//用户id

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

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Vip{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", contact='" + contact + '\'' +
                ", userId=" + userId +
                '}';
    }
}
