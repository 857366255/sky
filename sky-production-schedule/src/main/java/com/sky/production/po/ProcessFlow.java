package com.sky.production.po;

/**
 * 工艺流程
 * Created by wz on 2018/3/26.
 */
public class ProcessFlow {
    private Integer id;//唯一标识符
    private String name;//名称
    private Integer suppliesid;//产品(半成品)id
    private String fromtype;//(从)类型
    private Integer fromid;//(从)id
    private String totype;//(到)类型
    private Integer toid;//(到)id

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSuppliesid() {
        return suppliesid;
    }

    public void setSuppliesid(Integer suppliesid) {
        this.suppliesid = suppliesid;
    }

    public String getFromtype() {
        return fromtype;
    }

    public void setFromtype(String fromtype) {
        this.fromtype = fromtype;
    }

    public Integer getFromid() {
        return fromid;
    }

    public void setFromid(Integer fromid) {
        this.fromid = fromid;
    }

    public String getTotype() {
        return totype;
    }

    public void setTotype(String totype) {
        this.totype = totype;
    }

    public Integer getToid() {
        return toid;
    }

    public void setToid(Integer toid) {
        this.toid = toid;
    }

    @Override
    public String toString() {
        return "ProcessFlow{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", suppliesid=" + suppliesid +
                ", fromtype='" + fromtype + '\'' +
                ", fromid=" + fromid +
                ", totype='" + totype + '\'' +
                ", toid=" + toid +
                '}';
    }
}
