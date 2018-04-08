package com.sky.admin.po;

/**
 * 表字段
 */
public class TableField {
    private Integer id;//唯一标示符
    private String tableEn;//表名称
    private String fieldEn;//字段名称
    private String inputType;//输入框类型

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

    public String getFieldEn() {
        return fieldEn;
    }

    public void setFieldEn(String fieldEn) {
        this.fieldEn = fieldEn;
    }

    public String getInputType() {
        return inputType;
    }

    public void setInputType(String inputType) {
        this.inputType = inputType;
    }

    @Override
    public String toString() {
        return "TableField{" +
                "id=" + id +
                ", tableEn='" + tableEn + '\'' +
                ", fieldEn='" + fieldEn + '\'' +
                ", inputType='" + inputType + '\'' +
                '}';
    }
}
