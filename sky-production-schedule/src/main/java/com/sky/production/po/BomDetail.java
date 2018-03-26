package com.sky.production.po;

/**
 * BOM明细
 * Created by wz on 2018/3/26.
 */
public class BomDetail {
    private Integer id;//唯一标识符
    private Integer bomid;//BomId
    private Integer suppliesid;//材料id
    private float suppliesnumber;//材料数量

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBomid() {
        return bomid;
    }

    public void setBomid(Integer bomid) {
        this.bomid = bomid;
    }

    public Integer getSuppliesid() {
        return suppliesid;
    }

    public void setSuppliesid(Integer suppliesid) {
        this.suppliesid = suppliesid;
    }

    public float getSuppliesnumber() {
        return suppliesnumber;
    }

    public void setSuppliesnumber(float suppliesnumber) {
        this.suppliesnumber = suppliesnumber;
    }

    @Override
    public String toString() {
        return "BomDetail{" +
                "id=" + id +
                ", bomid=" + bomid +
                ", suppliesid=" + suppliesid +
                ", suppliesnumber=" + suppliesnumber +
                '}';
    }
}
