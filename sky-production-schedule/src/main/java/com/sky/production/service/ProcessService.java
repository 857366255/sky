package com.sky.production.service;

import com.sky.production.po.Process;


import java.util.Map;

/**
 * Created by wz on 2018/3/27.
 */
public interface ProcessService {
    Map<String,Object> getParams(Integer limit, Integer page, Process section);
    Boolean doAdd(Process section);
    Process findById(Integer id);
    Boolean doUpdate(Process section);
    Boolean doDelete(Integer id);
}
