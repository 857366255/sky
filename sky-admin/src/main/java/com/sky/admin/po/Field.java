package com.sky.admin.po;

/**
 * 实体类:字段信息
 * Created by wz on 2018/2/5.
 */
public class Field {

    private Integer id;//唯一标识符
    private Integer configurationpageId;//配置页面id
    private String tableEn;//表名称en
    private String fieldEn;//字段名称en
    private String name;//名称
    private Boolean isshowlist;//是否显示列表
    private Integer listsorting;//列表排序号
    private Boolean isedit;//是否编辑
    private Integer editsorting;//编辑排序号
    private String inputtype;//输入框类型
    private Boolean isquery;//是否查询
    private String querytype;//查询类型
    private Integer querysorting;//查询排序号

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getConfigurationpageId() {
        return configurationpageId;
    }

    public void setConfigurationpageId(Integer configurationpageId) {
        this.configurationpageId = configurationpageId;
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

    public Boolean getIsshowlist() {
        return isshowlist;
    }

    public void setIsshowlist(Boolean isshowlist) {
        this.isshowlist = isshowlist;
    }

    public Integer getListsorting() {
        return listsorting;
    }

    public void setListsorting(Integer listsorting) {
        this.listsorting = listsorting;
    }

    public Boolean getIsedit() {
        return isedit;
    }

    public void setIsedit(Boolean isedit) {
        this.isedit = isedit;
    }

    public Integer getEditsorting() {
        return editsorting;
    }

    public void setEditsorting(Integer editsorting) {
        this.editsorting = editsorting;
    }

    public String getInputtype() {
        return inputtype;
    }

    public void setInputtype(String inputtype) {
        this.inputtype = inputtype;
    }

    public Boolean getIsquery() {
        return isquery;
    }

    public void setIsquery(Boolean isquery) {
        this.isquery = isquery;
    }

    public String getQuerytype() {
        return querytype;
    }

    public void setQuerytype(String querytype) {
        this.querytype = querytype;
    }

    public Integer getQuerysorting() {
        return querysorting;
    }

    public void setQuerysorting(Integer querysorting) {
        this.querysorting = querysorting;
    }

    @Override
    public String toString() {
        return "Field{" +
                "id=" + id +
                ", configurationpageId=" + configurationpageId +
                ", tableEn='" + tableEn + '\'' +
                ", fieldEn='" + fieldEn + '\'' +
                ", name='" + name + '\'' +
                ", isshowlist=" + isshowlist +
                ", listsorting=" + listsorting +
                ", isedit=" + isedit +
                ", editsorting=" + editsorting +
                ", inputtype='" + inputtype + '\'' +
                ", isquery=" + isquery +
                ", querytype='" + querytype + '\'' +
                ", querysorting=" + querysorting +
                '}';
    }
}
