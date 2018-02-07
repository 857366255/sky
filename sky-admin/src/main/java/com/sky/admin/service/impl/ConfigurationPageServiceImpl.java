package com.sky.admin.service.impl;

import com.sky.admin.dao.ConfigurationPageDao;
import com.sky.admin.dao.FieldDao;
import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.po.Field;
import com.sky.admin.service.ConfigurationPageService;
import com.sky.admin.vo.EditField;
import com.sky.admin.vo.ListField;
import com.sky.admin.vo.QueryField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

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

    public List<EditField> getEditFields(String configurationPageCoding){
        return fieldDao.getEditFields(configurationPageCoding);
    }
    public List<ListField> getListFields(String configurationPageCoding){
        return fieldDao.getListFields(configurationPageCoding);
    }
    public List<QueryField> getQueryFields(String configurationPageCoding){
        return fieldDao.getQueryFields(configurationPageCoding);
    }
    public ConfigurationPage getConfiguration(String coding){
        return configurationPageDao.findById(coding);
    }

    public List<ConfigurationPage> getConfigurationPages(){
        return configurationPageDao.findAll();
    }

    @Transactional
    public Boolean doAdd(ConfigurationPage cp) {
        cp=configurationPageDao.getTableData(cp);
        if(configurationPageDao.doAdd(cp)){
            return addField(cp);
        }
        return false;
    }

    @Transactional
    public Boolean doDelete(String coding) {
        if(fieldDao.doDeleteByConfigurationPageCoding(coding)){
            if( configurationPageDao.doDelete(coding)){
                return true;
            }
        }
        return false;
    }

    @Transactional
    public Boolean doUpdate(ConfigurationPage cp){
        ConfigurationPage cpTemp = configurationPageDao.findById(cp.getCoding());
        if(cpTemp!=null && !cp.equalsTableEn(cpTemp)){
            fieldDao.doDeleteByConfigurationPageCoding(cpTemp.getCoding());
            cp=configurationPageDao.getTableData(cp);
            configurationPageDao.doUpdate(cp);
            return addField(cp);
        }
        System.out.println(cpTemp);
        return false;
    }

    /**
     * 根据配置页面添加字段信息
     * @param cp
     * @return
     */
    private Boolean addField(ConfigurationPage cp){
        if(cp.getTableEn()!=null){
            List<Field> fields = fieldDao.getTableFieldData(cp.getTableEn(),cp.getCoding());
            for(Field field :fields){
                if(!fieldDao.doAdd(field)) return false;
            }
            return true;
        }
        return false;
    }
}
