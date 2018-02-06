package com.sky.admin.po;

/**
 * 实体类:字段信息
 * Created by wz on 2018/2/5.
 */
public class Field {
    private String coding;//唯一标识符
    private String configurationPageCoding;//配置页面编码
    private String tableEn;//数据库表名
    private String fieldEn;//数据库字段名称
    private String name;//名称
    /*编辑字段属性*/
    private Boolean isShowEdit;//是否显示
    private Boolean isEdit;//是否编辑
    private String inputCoding;//输入框编码
    private Integer sortingEdit;//编辑排序
    /*列表字段属性*/
    private Boolean isShowList;//列表显示是否
    private Integer sortingList;//列表排序
    /*查询字段属性*/
    private Boolean isQuery;//是否查询
    private String queryType;//查询条件类型
    private Integer sortingQuery;//查询排序

    public String getCoding() {
        return coding;
    }

    public void setCoding(String coding) {
        this.coding = coding;
    }

    public String getConfigurationPageCoding() {
        return configurationPageCoding;
    }

    public void setConfigurationPageCoding(String configurationPageCoding) {
        this.configurationPageCoding = configurationPageCoding;
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

    public Boolean getShowEdit() {
        return isShowEdit;
    }

    public void setShowEdit(Boolean showEdit) {
        isShowEdit = showEdit;
    }

    public Boolean getEdit() {
        return isEdit;
    }

    public void setEdit(Boolean edit) {
        isEdit = edit;
    }

    public String getInputCoding() {
        return inputCoding;
    }

    public void setInputCoding(String inputCoding) {
        this.inputCoding = inputCoding;
    }

    public Integer getSortingEdit() {
        return sortingEdit;
    }

    public void setSortingEdit(Integer sortingEdit) {
        this.sortingEdit = sortingEdit;
    }

    public Boolean getShowList() {
        return isShowList;
    }

    public void setShowList(Boolean showList) {
        isShowList = showList;
    }

    public Integer getSortingList() {
        return sortingList;
    }

    public void setSortingList(Integer sortingList) {
        this.sortingList = sortingList;
    }

    public Boolean getQuery() {
        return isQuery;
    }

    public void setQuery(Boolean query) {
        isQuery = query;
    }

    public String getQueryType() {
        return queryType;
    }

    public void setQueryType(String queryType) {
        this.queryType = queryType;
    }

    public Integer getSortingQuery() {
        return sortingQuery;
    }

    public void setSortingQuery(Integer sortingQuery) {
        this.sortingQuery = sortingQuery;
    }

    @Override
    public String toString() {
        return "Field{" +
                "coding='" + coding + '\'' +
                ", configurationPageCoding='" + configurationPageCoding + '\'' +
                ", tableEn='" + tableEn + '\'' +
                ", fieldEn='" + fieldEn + '\'' +
                ", name='" + name + '\'' +
                ", isShowEdit=" + isShowEdit +
                ", isEdit=" + isEdit +
                ", inputCoding='" + inputCoding + '\'' +
                ", sortingEdit=" + sortingEdit +
                ", isShowList=" + isShowList +
                ", sortingList=" + sortingList +
                ", isQuery=" + isQuery +
                ", queryType='" + queryType + '\'' +
                ", sortingQuery=" + sortingQuery +
                '}';
    }
}
