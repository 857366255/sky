package com.sky.production.service.impl;

import com.sky.admin.vo.Limit;
import com.sky.production.dao.BomDao;
import com.sky.production.dao.SectionDao;
import com.sky.production.po.Bom;
import com.sky.production.po.Section;
import com.sky.production.service.BomService;
import com.sky.production.service.SectionService;
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
public class BomServiceimpl implements BomService {

    @Autowired
    private BomDao bomDao;

    public Map<String,Object> getParams(Integer limit, Integer  page, Bom bom){
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",bomDao.countData(new Bom()));
        params.put("data",bomDao.findData( new Limit(page, limit)  ,bom));
        params.put("msg","SUCCESS");
        return  params;
    }

    @Transactional
    public Boolean doAdd(Bom bom) {
        return bomDao.doAdd(bom);
    }

    @Transactional
    public Bom findById(Integer id){
        return bomDao.findById(id);
    }

    @Transactional
    public Boolean doUpdate(Bom bom){
        return bomDao.doUpdate(bom);
    }

    @Transactional
    public Boolean doDelete(Integer id) {
        return bomDao.doDelete(id);
    }

    public List<Bom> findAll() {
        List<Bom> bomList = bomDao.findAll();
        bomList.add(0,new Bom());
        return bomList;
    }
}
