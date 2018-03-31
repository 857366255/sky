package com.sky.production.service.impl;

import com.sky.admin.vo.Limit;
import com.sky.production.dao.SuppliesProcessDao;
import com.sky.production.po.SuppliesProcess;
import com.sky.production.service.DevicecapacitydetailService;
import com.sky.production.service.SuppliesprocessService;
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
public class SuppliesprocessServiceimpl implements SuppliesprocessService {

    @Autowired
    private SuppliesProcessDao suppliesProcessDao;

    public Map<String,Object> getParams(Integer limit, Integer  page, SuppliesProcess suppliesprocess){
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",suppliesProcessDao.countData(new SuppliesProcess()));
        params.put("data",suppliesProcessDao.findData( new Limit(page, limit)  ,suppliesprocess));
        params.put("msg","SUCCESS");
        return  params;
    }

    @Transactional
    public Boolean doAdd(SuppliesProcess suppliesprocess) {
        return suppliesProcessDao.doAdd(suppliesprocess);
    }

    @Transactional
    public SuppliesProcess findById(Integer id){
        return suppliesProcessDao.findById(id);
    }

    @Transactional
    public Boolean doUpdate(SuppliesProcess suppliesprocess){
        return suppliesProcessDao.doUpdate(suppliesprocess);
    }

    @Transactional
    public Boolean doDelete(Integer id) {
        return suppliesProcessDao.doDelete(id);
    }

    public List<SuppliesProcess> findAll() {
        List<SuppliesProcess> suppliesprocessList = suppliesProcessDao.findAll();
        suppliesprocessList.add(0,new SuppliesProcess());
        return suppliesprocessList;
    }
}
