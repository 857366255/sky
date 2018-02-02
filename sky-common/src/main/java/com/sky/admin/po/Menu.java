package com.sky.admin.po;

import java.util.List;

/**
 * Created by wz on 2017/12/15.
 * 菜单栏
 */
public class Menu {
    private String coding;//编码
    private String name;//名称
    private String icon;//图标
    private Integer sorting;//排序号
    private Boolean isEnablement;//是否启用
    private String superiorCoding;//上级编码
    private List<Menu> menuList;//通过查询上级编码找到下级菜单
    private String configurationPageCoding;//配置页面编码
    private String url;//链接
    private String openStyle;//打开页面样式

    public String getCoding() {
        return coding;
    }

    public void setCoding(String coding) {
        this.coding = coding;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getSorting() {
        return sorting;
    }

    public void setSorting(Integer sorting) {
        this.sorting = sorting;
    }

    public Boolean getEnablement() {
        return isEnablement;
    }

    public void setEnablement(Boolean enablement) {
        isEnablement = enablement;
    }

    public String getSuperiorCoding() {
        return superiorCoding;
    }

    public void setSuperiorCoding(String superiorCoding) {
        this.superiorCoding = superiorCoding;
    }

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }

    public String getConfigurationPageCoding() {
        return configurationPageCoding;
    }

    public void setConfigurationPageCoding(String configurationPageCoding) {
        this.configurationPageCoding = configurationPageCoding;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getOpenStyle() {
        return openStyle;
    }

    public void setOpenStyle(String openStyle) {
        this.openStyle = openStyle;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "coding='" + coding + '\'' +
                ", name='" + name + '\'' +
                ", icon='" + icon + '\'' +
                ", sorting=" + sorting +
                ", isEnablement=" + isEnablement +
                ", superiorCoding='" + superiorCoding + '\'' +
                ", menuList=" + menuList +
                ", configurationPageCoding='" + configurationPageCoding + '\'' +
                ", url='" + url + '\'' +
                ", openStyle='" + openStyle + '\'' +
                '}';
    }
}