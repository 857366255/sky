package com.sky.admin.po;

public class TableRelevance {
    private Integer id;
    private Integer tableid;
    private String tableEn;
    private String tableidFieldEn;
    private String fieldEn;
    private Integer tableRelevanceid;
    private String tableRelevanceidFieldEn;
    private String type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTableid() {
        return tableid;
    }

    public void setTableid(Integer tableid) {
        this.tableid = tableid;
    }

    public String getTableidFieldEn() {
        return tableidFieldEn;
    }

    public void setTableidFieldEn(String tableidFieldEn) {
        this.tableidFieldEn = tableidFieldEn;
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

    public Integer getTableRelevanceid() {
        return tableRelevanceid;
    }

    public void setTableRelevanceid(Integer tableRelevanceid) {
        this.tableRelevanceid = tableRelevanceid;
    }

    public String getTableRelevanceidFieldEn() {
        return tableRelevanceidFieldEn;
    }

    public void setTableRelevanceidFieldEn(String tableRelevanceidFieldEn) {
        this.tableRelevanceidFieldEn = tableRelevanceidFieldEn;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "TableRelevance{" +
                "id=" + id +
                ", tableid=" + tableid +
                ", tableEn='" + tableEn + '\'' +
                ", tableidFieldEn='" + tableidFieldEn + '\'' +
                ", fieldEn='" + fieldEn + '\'' +
                ", tableRelevanceid=" + tableRelevanceid +
                ", tableRelevanceidFieldEn='" + tableRelevanceidFieldEn + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}
