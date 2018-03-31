package com.sky.production.service.impl;

import com.sky.admin.vo.Limit;
import com.sky.production.dao.DeviceTypeDao;
import com.sky.production.dao.ProcessDao;
import com.sky.production.po.DeviceType;
import com.sky.production.po.Process;
import com.sky.production.po.Supplies;
import com.sky.production.service.DevicetypeService;
import com.sky.production.service.ProcessService;
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
public class ProcessServiceimpl implements ProcessService{

    @Autowired
    private ProcessDao processDao;

    public Map<String,Object> getParams(Integer limit, Integer  page, Process process){
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",processDao.countData(new Process()));
        params.put("data",processDao.findData( new Limit(page, limit)  ,process));
        params.put("msg","SUCCESS");
        return  params;
    }

    @Transactional
    public Boolean doAdd(Process process) {
        return processDao.doAdd(process);
    }

    @Transactional
    public Process findById(Integer id){
        return processDao.findById(id);
    }

    @Transactional
    public Boolean doUpdate(Process process){
        return processDao.doUpdate(process);
    }

    @Transactional
    public Boolean doDelete(Integer id) {
        return processDao.doDelete(id);
    }

    public List<Process> findAll() {
        List<Process> processList = processDao.findAll();
        processList.add(0,new Process());
        return processList;
    }


}
