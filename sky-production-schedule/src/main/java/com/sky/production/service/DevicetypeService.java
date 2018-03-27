package com.sky.production.service;

import com.sky.production.po.DeviceType;

import java.util.Map;

/**
 * Created by wz on 2018/3/27.
 */
public interface DevicetypeService {
    Map<String,Object> getParams(Integer limit, Integer  page, DeviceType deviceType);
    Boolean doAdd(DeviceType deviceType);
    DeviceType findById(Integer id);
    Boolean doUpdate(DeviceType deviceType);
    Boolean doDelete(Integer id);
}
