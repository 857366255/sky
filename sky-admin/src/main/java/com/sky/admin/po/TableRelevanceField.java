package com.sky.admin.po;

public class TableRelevanceField {
    private Integer id;
    private Integer tableRelevanceid;
    private String fieldEn;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTableRelevanceid() {
        return tableRelevanceid;
    }

    public void setTableRelevanceid(Integer tableRelevanceid) {
        this.tableRelevanceid = tableRelevanceid;
    }

    public String getFieldEn() {
        return fieldEn;
    }

    public void setFieldEn(String fieldEn) {
        this.fieldEn = fieldEn;
    }

    @Override
    public String toString() {
        return "TableRelevanceField{" +
                "id=" + id +
                ", tableRelevanceid=" + tableRelevanceid +
                ", fieldEn='" + fieldEn + '\'' +
                '}';
    }
}
