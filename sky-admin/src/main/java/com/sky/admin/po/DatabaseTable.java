package com.sky.admin.po;

/**
 * Created by wz on 2018/3/17.
 */
public class DatabaseTable {
    private String tableEn;
    private String annotation;

    public String getTableEn() {
        return tableEn;
    }

    public void setTableEn(String tableEn) {
        this.tableEn = tableEn;
    }

    public String getAnnotation() {
        return annotation;
    }

    public void setAnnotation(String annotation) {
        this.annotation = annotation;
    }

    @Override
    public String toString() {
        return "DatabaseTable{" +
                "tableEn='" + tableEn + '\'' +
                ", annotation='" + annotation + '\'' +
                '}';
    }
}
