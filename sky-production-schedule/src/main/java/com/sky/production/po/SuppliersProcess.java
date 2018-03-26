package com.sky.production.po;

/**
 * 物资工艺
 * Created by wz on 2018/3/26.
 */
public class SuppliersProcess {
    private Integer id;//唯一标识符
    private Integer suppliersid;//产品(半成品)id
    private Integer sectionid;//工段id
    private Integer processid;//工艺id

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSuppliersid() {
        return suppliersid;
    }

    public void setSuppliersid(Integer suppliersid) {
        this.suppliersid = suppliersid;
    }

    public Integer getSectionid() {
        return sectionid;
    }

    public void setSectionid(Integer sectionid) {
        this.sectionid = sectionid;
    }

    public Integer getProcessid() {
        return processid;
    }

    public void setProcessid(Integer processid) {
        this.processid = processid;
    }

    @Override
    public String toString() {
        return "SuppliersProcess{" +
                "id=" + id +
                ", suppliersid=" + suppliersid +
                ", sectionid=" + sectionid +
                ", processid=" + processid +
                '}';
    }
}
