package com.sky.admin.service.impl;

import com.sky.admin.dao.TableDao;
import com.sky.admin.dao.TableRelevanceDao;
import com.sky.admin.po.Table;
import com.sky.admin.po.TableRelevance;
import com.sky.admin.service.TableRelevanceService;
import com.sky.admin.service.TableService;
import com.sky.admin.vo.Limit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TableServiceImpl implements TableService {

    @Autowired
    private TableDao tableDao;

    public Map<String, Object> getParams(Integer limit, Integer page, Table table) {
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",tableDao.countData(table));
        params.put("data",tableDao.findData( new Limit(page, limit)  ,table));
        params.put("msg","SUCCESS");
        return params;
    }

    public Boolean doAdd(Table vo) {
        return tableDao.doAdd(vo);
    }


    public Table findById(Integer id) {
        return tableDao.findById(id);
    }

    public Boolean doUpdate(Table vo) {
        return tableDao.doUpdate(vo);
    }

    public Boolean doDelete(Integer id) {
        return tableDao.doDelete(id);
    }

    public List<Table> findAll() {
        return tableDao.findAll();
    }
}
