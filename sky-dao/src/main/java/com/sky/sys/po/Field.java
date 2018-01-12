package com.sky.sys.po;

/**
 * Created by wz on 2017/12/15.
 * 字段
 */
public class Field {
    /**
     *编码
     */
    private String coding;
    /**
     *名称
     */
    private String name;

    /**
     * 字段名称
     */
    private String fieldEn;

    /**
     *配置页面编码
     */
    private String configurationPageCoding;
    /**
     *表编码
     */
    private String tableCoding;
    /**
     *字段
     */
    private String field;
    /**
    *注释
    */
    private String annotation;
    /**
     *类型
     */
    private String type;
    /**
     *大小
     */
    private Integer size;
    /**
     *输入类型
     */
    private String inputType;;
    /**
     *是否编辑
     */
    private Boolean isEdit;
    /**
     *是否必填
     */
    private Boolean isMust;
    /**
     *编辑注释
     */
    private String editAnnotation;
    /**
     *编辑排序号
     */
    private Integer editSorting;
    /**
     *是否显示列表
     */
    private Boolean isShowList;
    /**
     *列表宽度
     */
    private Integer listWidth;
    /**
     *列表排序号
     */
    private Integer listSorting;
    /**
     *查询排序号
     */
    private Integer querySorting;
    /**
     *是否查询
     */
    private Boolean isQuery;
    /**
     *查询站几列
     */
    private Integer queryOccupy;
    /**
     *是否显示从表
     */
    private Boolean isShowSlave;
    /**
     *从表宽度
     */
    private Integer slaveWidth;
    /**
     *从表排序
     */
    private Integer slaveSorting;

    public String getCoding() {
        return coding;
    }

    public void setCoding(String coding) {
        this.coding = coding;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFieldEn() {
        return fieldEn;
    }

    public void setFieldEn(String fieldEn) {
        this.fieldEn = fieldEn;
    }

    public String getConfigurationPageCoding() {
        return configurationPageCoding;
    }

    public void setConfigurationPageCoding(String configurationPageCoding) {
        this.configurationPageCoding = configurationPageCoding;
    }

    public String getTableCoding() {
        return tableCoding;
    }

    public void setTableCoding(String tableCoding) {
        this.tableCoding = tableCoding;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getAnnotation() {
        return annotation;
    }

    public void setAnnotation(String annotation) {
        this.annotation = annotation;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getInputType() {
        return inputType;
    }

    public void setInputType(String inputType) {
        this.inputType = inputType;
    }

    public Boolean getEdit() {
        return isEdit;
    }

    public void setEdit(Boolean edit) {
        isEdit = edit;
    }

    public Boolean getMust() {
        return isMust;
    }

    public void setMust(Boolean must) {
        isMust = must;
    }

    public String getEditAnnotation() {
        return editAnnotation;
    }

    public void setEditAnnotation(String editAnnotation) {
        this.editAnnotation = editAnnotation;
    }

    public Integer getEditSorting() {
        return editSorting;
    }

    public void setEditSorting(Integer editSorting) {
        this.editSorting = editSorting;
    }

    public Boolean getShowList() {
        return isShowList;
    }

    public void setShowList(Boolean showList) {
        isShowList = showList;
    }

    public Integer getListWidth() {
        return listWidth;
    }

    public void setListWidth(Integer listWidth) {
        this.listWidth = listWidth;
    }

    public Integer getListSorting() {
        return listSorting;
    }

    public void setListSorting(Integer listSorting) {
        this.listSorting = listSorting;
    }

    public Integer getQuerySorting() {
        return querySorting;
    }

    public void setQuerySorting(Integer querySorting) {
        this.querySorting = querySorting;
    }

    public Boolean getQuery() {
        return isQuery;
    }

    public void setQuery(Boolean query) {
        isQuery = query;
    }

    public Integer getQueryOccupy() {
        return queryOccupy;
    }

    public void setQueryOccupy(Integer queryOccupy) {
        this.queryOccupy = queryOccupy;
    }

    public Boolean getShowSlave() {
        return isShowSlave;
    }

    public void setShowSlave(Boolean showSlave) {
        isShowSlave = showSlave;
    }

    public Integer getSlaveWidth() {
        return slaveWidth;
    }

    public void setSlaveWidth(Integer slaveWidth) {
        this.slaveWidth = slaveWidth;
    }

    public Integer getSlaveSorting() {
        return slaveSorting;
    }

    public void setSlaveSorting(Integer slaveSorting) {
        this.slaveSorting = slaveSorting;
    }

    @Override
    public String toString() {
        return "Field{" +
                "coding='" + coding + '\'' +
                ", name='" + name + '\'' +
                ", fieldEn='" + fieldEn + '\'' +
                ", configurationPageCoding='" + configurationPageCoding + '\'' +
                ", tableCoding='" + tableCoding + '\'' +
                ", field='" + field + '\'' +
                ", annotation='" + annotation + '\'' +
                ", type='" + type + '\'' +
                ", size=" + size +
                ", inputType='" + inputType + '\'' +
                ", isEdit=" + isEdit +
                ", isMust=" + isMust +
                ", editAnnotation='" + editAnnotation + '\'' +
                ", editSorting=" + editSorting +
                ", isShowList=" + isShowList +
                ", listWidth=" + listWidth +
                ", listSorting=" + listSorting +
                ", querySorting=" + querySorting +
                ", isQuery=" + isQuery +
                ", queryOccupy=" + queryOccupy +
                ", isShowSlave=" + isShowSlave +
                ", slaveWidth=" + slaveWidth +
                ", slaveSorting=" + slaveSorting +
                '}';
    }
}

