package com.sky.admin.po;

public class Table {
    private Integer id;
    private String tableEn;
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTableEn() {
        return tableEn;
    }

    public void setTableEn(String tableEn) {
        this.tableEn = tableEn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Table{" +
                "id=" + id +
                ", tableEn='" + tableEn + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
