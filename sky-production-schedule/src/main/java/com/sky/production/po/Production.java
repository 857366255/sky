package com.sky.production.po;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 生产单
 * Created by wz on 2018/3/26.
 */
public class Production {
    private Integer id;//唯一标识符
    private Integer suppliesid;//物资id
    private String suppliesname;
    private Supplies supplies;
    private float suppliesnumber;//数量
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date deliverydate;//交货日期

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

    public float getSuppliesnumber() {
        return suppliesnumber;
    }

    public void setSuppliesnumber(float suppliesnumber) {
        this.suppliesnumber = suppliesnumber;
    }

    public Date getDeliverydate() {
        return deliverydate;
    }

    public void setDeliverydate(Date deliverydate) {
        this.deliverydate = deliverydate;
    }

    public String getSuppliesname() {
        return suppliesname;
    }

    public void setSupplies(Supplies supplies) {
        if(supplies != null) this.suppliesname = supplies.getName();
        this.supplies = supplies;
    }


    @Override
    public String toString() {
        return "Production{" +
                "id=" + id +
                ", suppliesid=" + suppliesid +
                ", suppliesname='" + suppliesname + '\'' +
                ", supplies=" + supplies +
                ", suppliesnumber=" + suppliesnumber +
                ", deliverydate=" + deliverydate +
                '}';
    }
}
