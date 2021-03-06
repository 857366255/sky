package com.sky.admin.vo;

import com.sky.admin.vo.base.BaseField;

/**
 * 实体类:查询字段信息
 * Created by wz on 2018/2/5.
 */
public class QueryField extends BaseField {

    private Boolean query;//是否查询
    private String queryType;//查询条件类型
    private Integer sortingQuery;//查询排序

    public Boolean getQuery() {
        return query;
    }

    public void setQuery(Boolean query) {
        this.query = query;
    }

    public String getQueryType() {
        return queryType;
    }

    public void setQueryType(String queryType) {
        this.queryType = queryType;
    }

    public Integer getSortingQuery() {
        return sortingQuery;
    }

    public void setSortingQuery(Integer sortingQuery) {
        this.sortingQuery = sortingQuery;
    }

    @Override
    public String toString() {
        return "QueryField{" +
                super.toString() +
                "query=" + query +
                ", queryType='" + queryType + '\'' +
                ", sortingQuery=" + sortingQuery +
                '}';
    }
}
