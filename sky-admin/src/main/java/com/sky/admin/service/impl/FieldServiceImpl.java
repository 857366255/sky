package com.sky.admin.service.impl;

import com.sky.admin.dao.ConfigurationPageDao;
import com.sky.admin.dao.FieldDao;
import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.po.Field;
import com.sky.admin.service.ConfigurationPageService;
import com.sky.admin.service.FieldService;
import com.sky.admin.vo.Limit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/2/6.
 */
@Service
public class FieldServiceImpl implements FieldService {

    @Autowired
    private FieldDao fieldDao;

    public Map<String, Object> getParams(Integer limit, Integer page, Field field) {
        Map<String,Object> params =  new HashMap<String, Object>();
        Limit lt = null;
        if(limit!=null && page!=null) lt = new Limit(page, limit);
        params.put("code","0");
        params.put("count",fieldDao.countData(new Field()));
        params.put("data",fieldDao.findData( lt  ,field));
        params.put("msg","SUCCESS");
        return  params;
    }

    public ConfigurationPage findById(Integer id) {
        return null;
    }

    public Boolean doAdd(Field field) {
        return null;
    }

    public Boolean doDelete(Integer id) {
        return null;
    }

    public Boolean doUpdate(Field field) {
        return null;
    }
}
