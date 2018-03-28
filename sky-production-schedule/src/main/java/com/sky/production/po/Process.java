package com.sky.production.po;

/**
 * 工序
 * Created by wz on 2018/3/26.
 */
public class Process {
    private Integer id;//唯一标识符
    private String name;//名称
    private Integer sectionid;//工段id
    private String sectionname;//工段名称
    private Section section;

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

    public Integer getSectionid() {
        return sectionid;
    }

    public void setSectionid(Integer sectionid) {
        this.sectionid = sectionid;
    }

    public String getSectionname() {
        return sectionname;
    }

  /*  public void setSectionname(String sectionname) {
        this.sectionname = sectionname;
    }*/

    public Section getSection() {
        return section;
    }

    public void setSection(Section section) {
        this.sectionname = section.getName();
        this.section = section;
    }

    @Override
    public String toString() {
        return "Process{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sectionid=" + sectionid +
                ", sectionname='" + sectionname + '\'' +
                '}';
    }
}
