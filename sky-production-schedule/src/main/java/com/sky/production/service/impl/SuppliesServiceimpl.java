package com.sky.production.service.impl;

import com.sky.admin.vo.Limit;
import com.sky.production.dao.SuppliesDao;
import com.sky.production.po.Supplies;
import com.sky.production.service.SuppliesService;
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
public class SuppliesServiceimpl implements SuppliesService {

    @Autowired
    private SuppliesDao suppliesDao;

    public Map<String,Object> getParams(Integer limit, Integer  page, Supplies supplies){
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",suppliesDao.countData(new Supplies()));
        params.put("data",suppliesDao.findData( new Limit(page, limit)  ,supplies));
        params.put("msg","SUCCESS");
        return  params;
    }

    @Transactional
    public Boolean doAdd(Supplies supplies) {
        return suppliesDao.doAdd(supplies);
    }

    @Transactional
    public Supplies findById(Integer id){
        return suppliesDao.findById(id);
    }

    @Transactional
    public Boolean doUpdate(Supplies supplies){
        return suppliesDao.doUpdate(supplies);
    }

    @Transactional
    public Boolean doDelete(Integer id) {
        return suppliesDao.doDelete(id);
    }

    public List<Supplies> findAll() {
        List<Supplies> suppliesList = suppliesDao.findAll();
        suppliesList.add(0,new Supplies());
        return suppliesList;
    }
}
