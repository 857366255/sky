package com.sky.production.service.impl;

import com.sky.admin.vo.Limit;
import com.sky.production.dao.BomDao;
import com.sky.production.dao.BomDetailDao;
import com.sky.production.po.Bom;
import com.sky.production.po.BomDetail;
import com.sky.production.service.BomService;
import com.sky.production.service.BomdetailService;
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
public class BomdetailServiceimpl implements BomdetailService {

    @Autowired
    private BomDetailDao bomdetailDao;

    public Map<String,Object> getParams(Integer limit, Integer  page, BomDetail bomdetail){
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",bomdetailDao.countData(new BomDetail()));
        params.put("data",bomdetailDao.findData( new Limit(page, limit)  ,bomdetail));
        params.put("msg","SUCCESS");
        return  params;
    }

    @Transactional
    public Boolean doAdd(BomDetail bomdetail) {
        return bomdetailDao.doAdd(bomdetail);
    }

    @Transactional
    public BomDetail findById(Integer id){
        return bomdetailDao.findById(id);
    }

    @Transactional
    public Boolean doUpdate(BomDetail bomdetail){
        return bomdetailDao.doUpdate(bomdetail);
    }

    @Transactional
    public Boolean doDelete(Integer id) {
        return bomdetailDao.doDelete(id);
    }

    public List<BomDetail> findAll() {
        List<BomDetail> bomdetailList = bomdetailDao.findAll();
        bomdetailList.add(0,new BomDetail());
        return bomdetailList;
    }
}
