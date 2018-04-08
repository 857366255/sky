package com.sky.admin.service.impl;


import com.sky.admin.dao.TableFieldDao;
import com.sky.admin.po.TableField;
import com.sky.admin.service.TableFieldService;
import com.sky.admin.vo.Limit;
import com.sky.tool.Conversion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by wz on 2018/2/6.
 */
@Service
public class TableFieldServiceImpl implements TableFieldService {

    @Autowired
    private TableFieldDao tableFieldDao;

    public Boolean updateTableField() {
        List<TableField> addTableFieldList = tableFieldDao.getAddTableField();
        List<TableField> deleteTableFieldList = tableFieldDao.getDeleteTableField();
        System.out.println("addTableFieldList:"+addTableFieldList);
        System.out.println("deleteTableFieldList:"+deleteTableFieldList);
        for(TableField tableField :addTableFieldList){
            tableFieldDao.doAdd(tableField);
        }
        for(TableField tableField :deleteTableFieldList){
            tableFieldDao.doDelete(tableField.getId());
        }
        addTableFieldList = tableFieldDao.getAddTableField();
        deleteTableFieldList = tableFieldDao.getDeleteTableField();
        System.out.println("addTableFieldList:"+addTableFieldList);
        System.out.println("deleteTableFieldList:"+deleteTableFieldList);
        return null;
    }

    public Map<String, Object> getParams(Integer limit, Integer page, TableField tableField) {
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",tableFieldDao.countData(tableField));
        params.put("data",tableFieldDao.findData( new Limit(page, limit)  ,tableField));
        params.put("msg","SUCCESS");
        return  params;
    }
    public Map<String, Object> getTableParams(Integer limit, Integer page, TableField tableField) {
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",tableFieldDao.countTableData(tableField));
        params.put("data",tableFieldDao.findTableData( new Limit(page, limit)  ,tableField));
        params.put("msg","SUCCESS");
        return  params;
    }

    public Boolean doUpdateTableField(Map<String, Object> map) {
        TableField tableField = new TableField();
        tableField.setId(Conversion.valueOfInteger(map.get("id")));
        tableField.setTableEn(Conversion.valueOfString(map.get("tableEn")));
        tableField.setFieldEn(Conversion.valueOfString(map.get("fieldEn")));
        tableField.setInputType(Conversion.valueOfString(map.get("inputType")));
        System.out.println("tableField:"+tableField);
        return tableFieldDao.doUpdate(tableField);
    }

    public Boolean doAdd(TableField vo) {
        return null;
    }

    public TableField findById(Integer id) {
        return null;
    }

    public Boolean doUpdate(TableField tableField) {
        return tableFieldDao.doUpdate(tableField);
    }

    public Boolean doDelete(Integer id) {
        return null;
    }

    public List<TableField> findAll() {
        return null;
    }
}
