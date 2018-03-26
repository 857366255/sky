package com.sky.production.po;

/**
 * 设备产能明细
 * Created by wz on 2018/3/26.
 */
public class DeviceCapacityDetail {
    private Integer id;//唯一标识符
    private Integer devucetypeid;//设备类型id
    private Integer sectionid;//工段id
    private Integer processid;//工序id
    private float capacity;//private Integer ;//产能

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDevucetypeid() {
        return devucetypeid;
    }

    public void setDevucetypeid(Integer devucetypeid) {
        this.devucetypeid = devucetypeid;
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

    public float getCapacity() {
        return capacity;
    }

    public void setCapacity(float capacity) {
        this.capacity = capacity;
    }

    @Override
    public String toString() {
        return "DeviceCapacityDetail{" +
                "id=" + id +
                ", devucetypeid=" + devucetypeid +
                ", sectionid=" + sectionid +
                ", processid=" + processid +
                ", capacity=" + capacity +
                '}';
    }
}
