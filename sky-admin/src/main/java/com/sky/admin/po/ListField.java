package com.sky.admin.po;

import com.sky.admin.po.base.Field;

/**
 * 实体类:列表字段信息
 * Created by wz on 2018/2/5.
 */
public class ListField extends Field {

    private Boolean isShowList;//列表显示是否
    private Integer sortingList;//列表排序

    public Boolean getShowList() {
        return isShowList;
    }

    public void setShowList(Boolean showList) {
        isShowList = showList;
    }

    public Integer getSortingList() {
        return sortingList;
    }

    public void setSortingList(Integer sortingList) {
        this.sortingList = sortingList;
    }

    @Override
    public String toString() {
        return "ListField{" +
                super.toString() +
                "isShowList=" + isShowList +
                ", sortingList=" + sortingList +
                '}';
    }
}
