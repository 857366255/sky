package com.sky.admin.vo;

import com.sky.admin.vo.base.BaseField;

/**
 * 实体类:列表字段信息
 * Created by wz on 2018/2/5.
 */
public class ListField extends BaseField {

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
