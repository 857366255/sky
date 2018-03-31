package com.sky.production.po;

/**
 * 物资工艺
 * Created by wz on 2018/3/26.
 */
public class SuppliesProcess {
    private Integer id;//唯一标识符
    private Integer suppliesid;//产品(半成品)id
    private String suppliesname;
    private Supplies supplies;
    private Integer sectionid;//工段id
    private String sectionname;
    private Section section;
    private Integer processid;//工艺id
    private String processname;
    private Process process;

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

    public String getSuppliesname() {
        return suppliesname;
    }

    public void setSupplies(Supplies supplies) {
        if(supplies != null) this.suppliesname = supplies.getName();
        this.supplies = supplies;
    }

    public String getSectionname() {
        return sectionname;
    }

    public void setSection(Section section) {
        if(section != null) this.sectionname = section.getName();
        this.section = section;
    }

    public String getProcessname() {
        return processname;
    }

    public void setProcess(Process process) {
        if(process != null) this.processname = process.getName();
        this.process = process;
    }

    @Override
    public String toString() {
        return "SuppliesProcess{" +
                "id=" + id +
                ", suppliesid=" + suppliesid +
                ", sectionid=" + sectionid +
                ", processid=" + processid +
                '}';
    }
}
