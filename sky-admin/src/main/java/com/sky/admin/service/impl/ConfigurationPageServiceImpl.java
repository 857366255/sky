package com.sky.admin.service.impl;

import com.sky.admin.dao.ConfigurationPageDao;
import com.sky.admin.dao.FieldDao;
import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.po.Field;
import com.sky.admin.service.ConfigurationPageService;
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

    @Transactional
    public Boolean doAdd(ConfigurationPage cp) {
        cp=configurationPageDao.getTableData(cp);
        if(configurationPageDao.doAdd(cp)){
            if(cp.getTableEn()!=null){
                List<Field> fields = fieldDao.getTableFieldData(cp.getTableEn(),cp.getCoding());
                for(Field field :fields){
                    if(!fieldDao.doAdd(field)) return false;
                }
                return true;
            }
        }
        return false;
    }

    public Boolean doDelete(String coding) {

        return null;
    }
}
