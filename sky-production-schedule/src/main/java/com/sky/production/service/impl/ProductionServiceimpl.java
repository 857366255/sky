package com.sky.production.service.impl;

import com.sky.admin.vo.Limit;
import com.sky.production.dao.BomDao;
import com.sky.production.dao.ProductionDao;
import com.sky.production.po.Bom;
import com.sky.production.po.Production;
import com.sky.production.service.BomService;
import com.sky.production.service.ProductionService;
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
public class ProductionServiceimpl implements ProductionService {

    @Autowired
    private ProductionDao productionDao;

    public Map<String,Object> getParams(Integer limit, Integer  page, Production production){
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",productionDao.countData(new Production()));
        params.put("data",productionDao.findData( new Limit(page, limit)  ,production));
        params.put("msg","SUCCESS");
        return  params;
    }

    @Transactional
    public Boolean doAdd(Production production) {
        return productionDao.doAdd(production);
    }

    @Transactional
    public Production findById(Integer id){
        return productionDao.findById(id);
    }

    @Transactional
    public Boolean doUpdate(Production production){
        return productionDao.doUpdate(production);
    }

    @Transactional
    public Boolean doDelete(Integer id) {
        return productionDao.doDelete(id);
    }

    public List<Production> findAll() {
        List<Production> productionList = productionDao.findAll();
        productionList.add(0,new Production());
        return productionList;
    }
}
