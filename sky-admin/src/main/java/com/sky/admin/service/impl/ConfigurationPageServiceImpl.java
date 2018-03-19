package com.sky.admin.service.impl;

import com.sky.admin.dao.ConfigurationPageDao;
import com.sky.admin.dao.FieldDao;
import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.po.Field;
import com.sky.admin.service.ConfigurationPageService;
import com.sky.admin.vo.EditField;
import com.sky.admin.vo.Limit;
import com.sky.admin.vo.ListField;
import com.sky.admin.vo.QueryField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.Id;
import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/2/6.
 */
@Service
public class ConfigurationPageServiceImpl implements ConfigurationPageService {

    @Autowired
    private ConfigurationPageDao configurationPageDao;
    @Autowired
    private FieldDao fieldDao;
    private Field field = new Field();

    public Map<String,Object> getParams(Integer limit,Integer  page,ConfigurationPage configurationPage){
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",configurationPageDao.countData(new ConfigurationPage()));
        params.put("data",configurationPageDao.findData( new Limit(page, limit)  ,configurationPage));
        params.put("msg","SUCCESS");
        return  params;
    }
    public ConfigurationPage findById(Integer id){
        return configurationPageDao.findById(id);
    }

    public ConfigurationPage getConfiguration(String coding){
        return null;//configurationPageDao.findById(coding);
    }

    public List<ConfigurationPage> getConfigurationPages(){
        return configurationPageDao.findAll();
    }

    @Transactional
    public Boolean doAdd(ConfigurationPage cp) {
        return configurationPageDao.doAdd(cp);
    }

    @Transactional
    public Boolean doDelete(Integer id) {
        return configurationPageDao.doDelete(id);
    }

    @Transactional
    public Boolean doUpdate(ConfigurationPage cp){
        /*ConfigurationPage cpTemp = configurationPageDao.findById(cp.getCoding());
        if(cpTemp!=null && !cp.equalsTableEn(cpTemp)){
            fieldDao.doDeleteByConfigurationPageCoding(cpTemp.getCoding());
            cp=configurationPageDao.getTableData(cp);
            configurationPageDao.doUpdate(cp);
            return addField(cp);
        }
        System.out.println(cpTemp);*/
        return configurationPageDao.doUpdate(cp);
    }

    /**
     * 根据配置页面添加字段信息
     * @param cp
     * @return
     */
    private Boolean addField(ConfigurationPage cp){
        /*if(cp.getTableEn()!=null){
            List<Field> fields = fieldDao.getTableFieldData(cp.getTableEn(),cp.getCoding());
            for(Field field :fields){
                if(!fieldDao.doAdd(field)) return false;
            }
            return true;
        }*/
        return false;
    }

}
