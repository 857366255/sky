package com.sky.production.service;

import com.sky.admin.vo.Limit;
import com.sky.production.dao.ProcessFlowDao;
import com.sky.production.dao.ProductionDao;
import com.sky.production.po.ProcessFlow;
import com.sky.production.po.Production;
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
public class ProcessflowServiceimpl implements ProcessflowService {

    @Autowired
    private ProcessFlowDao processFlowDao;

    public Map<String,Object> getParams(Integer limit, Integer  page, ProcessFlow processFlow){
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",processFlowDao.countData(new ProcessFlow()));
        params.put("data",processFlowDao.findData( new Limit(page, limit)  ,processFlow));
        params.put("msg","SUCCESS");
        return  params;
    }

    @Transactional
    public Boolean doAdd(ProcessFlow processFlow) {
        return processFlowDao.doAdd(processFlow);
    }

    @Transactional
    public ProcessFlow findById(Integer id){
        return processFlowDao.findById(id);
    }

    @Transactional
    public Boolean doUpdate(ProcessFlow processFlow){
        return processFlowDao.doUpdate(processFlow);
    }

    @Transactional
    public Boolean doDelete(Integer id) {
        return processFlowDao.doDelete(id);
    }

    public List<ProcessFlow> findAll() {
        List<ProcessFlow> processFlowList = processFlowDao.findAll();
        processFlowList.add(0,new ProcessFlow());
        return processFlowList;
    }
}
