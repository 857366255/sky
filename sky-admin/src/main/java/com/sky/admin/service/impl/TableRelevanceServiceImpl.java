package com.sky.admin.service.impl;

import com.sky.admin.dao.TableRelevanceDao;
import com.sky.admin.po.TableRelevance;
import com.sky.admin.service.TableRelevanceService;
import com.sky.admin.vo.Limit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TableRelevanceServiceImpl implements TableRelevanceService {

    @Autowired
    private TableRelevanceDao tableRelevanceDao;

    public Map<String, Object> getParams(Integer limit, Integer page, TableRelevance tableRelevance) {
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",tableRelevanceDao.countData(tableRelevance));
        params.put("data",tableRelevanceDao.findData( new Limit(page, limit)  ,tableRelevance));
        params.put("msg","SUCCESS");
        return params;
    }

    public Boolean doAdd(TableRelevance vo) {
        return tableRelevanceDao.doAdd(vo);
    }

    public TableRelevance findById(Integer id) {
        return tableRelevanceDao.findById(id);
    }

    public Boolean doUpdate(TableRelevance vo) {
        return tableRelevanceDao.doUpdate(vo);
    }

    public Boolean doDelete(Integer id) {
        return tableRelevanceDao.doDelete(id);
    }

    public List<TableRelevance> findAll() {
        return tableRelevanceDao.findAll();
    }
}
