package com.sky.production.service.impl;

import com.sky.admin.vo.Limit;
import com.sky.production.dao.DeviceTypeDao;
import com.sky.production.po.DeviceType;
import com.sky.production.service.DevicetypeestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wz on 2018/3/27.
 */
@Service
public class DevicetypeServiceimpl implements DevicetypeestService {

    @Autowired
    private DeviceTypeDao deviceTypeDao;

    public Map<String,Object> getParams(Integer limit, Integer  page, DeviceType deviceType){
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",deviceTypeDao.countData(new DeviceType()));
        params.put("data",deviceTypeDao.findData( new Limit(page, limit)  ,deviceType));
        params.put("msg","SUCCESS");
        return  params;
    }
}
