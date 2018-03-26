package com.sky.production.po;

import java.util.Date;

/**
 * 生产单
 * Created by wz on 2018/3/26.
 */
public class Production {
    private Integer id;//唯一标识符
    private Integer suppliesid;//物资id
    private float suppliesnumber;//数量
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

    @Override
    public String toString() {
        return "Production{" +
                "id=" + id +
                ", suppliesid=" + suppliesid +
                ", suppliesnumber=" + suppliesnumber +
                ", deliverydate=" + deliverydate +
                '}';
    }
}
