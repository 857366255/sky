package com.sky.admin.po;

/**
 * Created by wz on 2018/2/5.
 */
public class ConfigurationPage {

    private Integer id;//唯一标识符
    private String name;//名称
    private String tableEn;//数据库表名

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

    public String getTableEn() {
        return tableEn;
    }

    public void setTableEn(String tableEn) {
        this.tableEn = tableEn;
    }


    @Override
    public String toString() {
        return "ConfigurationPage{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", tableEn='" + tableEn + '\'' +
                '}';
    }


}
