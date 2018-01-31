package com.sky.admin.po;

/**
 * 下拉框 需要显示的字段
 * Created by wz on 2018/1/31.
 */
public class SelectBoxShowField {
    private String coding;//唯一标识符
    private String selectBoxCoding;//选择框编码
    private String name;//名称
    private String tableEn;//数据库表名
    private String fieldEn;//数据库表字段
    private Integer sorting;//排序号
    private Boolean isShow;//是否值

    public String getCoding() {
        return coding;
    }

    public void setCoding(String coding) {
        this.coding = coding;
    }

    public String getSelectBoxCoding() {
        return selectBoxCoding;
    }

    public void setSelectBoxCoding(String selectBoxCoding) {
        this.selectBoxCoding = selectBoxCoding;
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

    public String getFieldEn() {
        return fieldEn;
    }

    public void setFieldEn(String fieldEn) {
        this.fieldEn = fieldEn;
    }

    public Integer getSorting() {
        return sorting;
    }

    public void setSorting(Integer sorting) {
        this.sorting = sorting;
    }

    public Boolean getShow() {
        return isShow;
    }

    public void setShow(Boolean show) {
        isShow = show;
    }

    @Override
    public String toString() {
        return "SelectBoxShowField{" +
                "coding='" + coding + '\'' +
                ", selectBoxCoding='" + selectBoxCoding + '\'' +
                ", name='" + name + '\'' +
                ", tableEn='" + tableEn + '\'' +
                ", fieldEn='" + fieldEn + '\'' +
                ", sorting=" + sorting +
                ", isShow=" + isShow +
                '}';
    }
}
