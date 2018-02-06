package com.sky.admin.vo;

import com.sky.admin.vo.base.BaseField;

/**
 * 实体类:编辑字段信息
 * Created by wz on 2018/2/5.
 */
public class EditField extends BaseField {

    private Boolean isShowEdit;//是否显示
    private Boolean isEdit;//是否编辑
    private String inputCoding;//输入框编码
    private Integer sortingEdit;//编辑排序

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

    @Override
    public String toString() {
        return "EditField{" +
                super.toString() +
                "isShowEdit=" + isShowEdit +
                ", isEdit=" + isEdit +
                ", inputCoding='" + inputCoding + '\'' +
                ", sortingEdit=" + sortingEdit +
                '}';
    }

}
