package com.sky.production.po;

/**
 * BOM
 * Created by wz on 2018/3/26.
 */
public class Bom {
    private Integer id;
    private Integer suppliesid;//产品(半成品)id
    private String suppliesname;
    private Supplies supplies;
    private Integer suppliesnumber;//产品(半成品)数量

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSuppliesid() {
        return suppliesid;
    }

    public void setSuppliesid(Integer suppliesid) {
        this.suppliesid = suppliesid;
    }

    public String getSuppliesname() {
        return suppliesname;
    }

    public void setSupplies(Supplies supplies) {
        if(supplies != null) this.suppliesname = supplies.getName();
        this.supplies = supplies;
    }

    public Integer getSuppliesnumber() {
        return suppliesnumber;
    }

    public void setSuppliesnumber(Integer suppliesnumber) {
        this.suppliesnumber = suppliesnumber;
    }

    @Override
    public String toString() {
        return "Bom{" +
                "id=" + id +
                ", suppliesid=" + suppliesid +
                ", suppliesname='" + suppliesname + '\'' +
                ", supplies=" + supplies +
                ", suppliesnumber=" + suppliesnumber +
                '}';
    }
}
