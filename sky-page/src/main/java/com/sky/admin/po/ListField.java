package com.sky.admin.po;

/**
 * Created by wz on 2018/1/25.
 */
public class ListField {
    private String coding;//唯一标识符
    private String tableEn;//数据库表名
    private String fieldEn;//数据库字段名称
    private String name;//名称
    private Boolean isShowList;//是否显示列表

    public String getCoding() {
        return coding;
    }

    public void setCoding(String coding) {
        this.coding = coding;
    }

    public String getTableEn() {
        return tableEn;
    }

    public void setTableEn(String tableEn) {
        this.tableEn = tableEn;
    }

    public String getFieldEn() {
        return fieldEn;
    }

    public void setFieldEn(String fieldEn) {
        this.fieldEn = fieldEn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getShowList() {
        return isShowList;
    }

    public void setShowList(Boolean showList) {
        isShowList = showList;
    }

    @Override
    public String toString() {
        return "ListField{" +
                "coding='" + coding + '\'' +
                ", tableEn='" + tableEn + '\'' +
                ", fieldEn='" + fieldEn + '\'' +
                ", name='" + name + '\'' +
                ", isShowList=" + isShowList +
                '}';
    }
}
