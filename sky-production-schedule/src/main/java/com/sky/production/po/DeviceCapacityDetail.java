package com.sky.production.po;

/**
 * 设备产能明细
 * Created by wz on 2018/3/26.
 */
public class DeviceCapacityDetail {
    private Integer id;//唯一标识符
    private Integer devucetypeid;//设备类型id
    private String devicetypename;
    private DeviceType devicetype;
    private Integer sectionid;//工段id
    private String sectionname;
    private Section section;
    private Integer processid;//工序id
    private String processname;
    private Process process;
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

    public String getDevicetypename() {
        return devicetypename;
    }

    public void setDevicetype(DeviceType devicetype) {
        if(devicetype != null) this.devicetypename = devicetype.getName();
        this.devicetype = devicetype;
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
        return "DeviceCapacityDetail{" +
                "id=" + id +
                ", devucetypeid=" + devucetypeid +
                ", devicetypename='" + devicetypename + '\'' +
                ", devicetype=" + devicetype +
                ", sectionid=" + sectionid +
                ", sectionname='" + sectionname + '\'' +
                ", section=" + section +
                ", processid=" + processid +
                ", processname='" + processname + '\'' +
                ", process=" + process +
                ", capacity=" + capacity +
                '}';
    }
}
