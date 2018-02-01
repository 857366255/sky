package com.sky.admin.po;

import java.util.List;

/**
 * Created by wz on 2017/12/15.
 * 菜单栏
 */
public class Menu {
    /**
     *编码
     */
    private String coding;
    /**
     *名称
     */
    private String name;
    /**
     *图标
     */
    private String icon;
    /**
     *排序号
     */
    private Integer sorting;
    /**
     *是否启用
     */
    private Boolean isEnablement;
    /**
     *上级编码
     */
    private String superiorCoding;
    /**
     * 通过查询上级编码找到下级菜单
     */
    private List<Menu> menuList;
    /**
     *配置页面编码
     */
    private String configurationPageCoding;
    /**
     *显示样式
     */
    private String displayStyle;
    /**
     *链接
     */
    private String url;

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

    public String getDisplayStyle() {
        return displayStyle;
    }

    public void setDisplayStyle(String displayStyle) {
        this.displayStyle = displayStyle;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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
                ", displayStyle='" + displayStyle + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}