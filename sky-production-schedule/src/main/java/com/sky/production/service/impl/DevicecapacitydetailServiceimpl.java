package com.sky.production.service.impl;

import com.sky.admin.vo.Limit;
import com.sky.production.dao.BomDetailDao;
import com.sky.production.dao.DeviceCapacityDetailDao;
import com.sky.production.po.BomDetail;
import com.sky.production.po.DeviceCapacityDetail;
import com.sky.production.service.BomdetailService;
import com.sky.production.service.DevicecapacitydetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/3/27.
 */
@Service
public class DevicecapacitydetailServiceimpl implements DevicecapacitydetailService {

    @Autowired
    private DeviceCapacityDetailDao deviceCapacityDetailDao;

    public Map<String,Object> getParams(Integer limit, Integer  page, DeviceCapacityDetail deviceCapacityDetail){
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",deviceCapacityDetailDao.countData(new DeviceCapacityDetail()));
        params.put("data",deviceCapacityDetailDao.findData( new Limit(page, limit)  ,deviceCapacityDetail));
        params.put("msg","SUCCESS");
        return  params;
    }

    @Transactional
    public Boolean doAdd(DeviceCapacityDetail deviceCapacityDetail) {
        return deviceCapacityDetailDao.doAdd(deviceCapacityDetail);
    }

    @Transactional
    public DeviceCapacityDetail findById(Integer id){
        return deviceCapacityDetailDao.findById(id);
    }

    @Transactional
    public Boolean doUpdate(DeviceCapacityDetail deviceCapacityDetail){
        return deviceCapacityDetailDao.doUpdate(deviceCapacityDetail);
    }

    @Transactional
    public Boolean doDelete(Integer id) {
        return deviceCapacityDetailDao.doDelete(id);
    }

    public List<DeviceCapacityDetail> findAll() {
        List<DeviceCapacityDetail> deviceCapacityDetailList = deviceCapacityDetailDao.findAll();
        deviceCapacityDetailList.add(0,new DeviceCapacityDetail());
        return deviceCapacityDetailList;
    }
}
