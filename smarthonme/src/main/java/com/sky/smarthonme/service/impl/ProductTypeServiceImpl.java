package com.sky.smarthonme.service.impl;

import com.sky.admin.vo.Limit;
import com.sky.smarthonme.dao.ProductTypeDao;
import com.sky.smarthonme.po.ProductType;
import com.sky.smarthonme.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by wz on 2018/2/6.
 */
@Service
public class ProductTypeServiceImpl implements ProductTypeService {

    @Autowired
    private ProductTypeDao productTypeDao;


    public Map<String, Object> getParams(Integer limit, Integer page, ProductType productType) {
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",productTypeDao.countData(productType));
        params.put("data",productTypeDao.findData( new Limit(page, limit)  ,productType));
        params.put("msg","SUCCESS");
        return  params;
    }

    public Boolean doAdd(ProductType productType) {
        return productTypeDao.doAdd(productType);
    }

    public ProductType findById(Integer id) {
        return productTypeDao.findById(id);
    }

    public Boolean doUpdate(ProductType tableField) {
        return productTypeDao.doUpdate(tableField);
    }

    public Boolean doDelete(Integer id) {
        return productTypeDao.doDelete(id);
    }

    public List<ProductType> findAll() {
        return productTypeDao.findAll();
    }
}
