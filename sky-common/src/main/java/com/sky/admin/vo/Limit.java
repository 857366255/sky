package com.sky.admin.vo;

/**
 * Created by wz on 2018/3/15.
 */
public class Limit {
    private Integer offset;
    private Integer rows;

    public Limit(Integer page, Integer limit){
        offset = limit*(page-1);
        rows = limit;
    }

    public Integer getOffset() {
        return offset;
    }

    public Integer getRows() {
        return rows;
    }
}
