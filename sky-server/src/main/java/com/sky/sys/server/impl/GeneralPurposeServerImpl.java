package com.sky.sys.server.impl;

import com.sky.sys.dao.ConfigurationPageDao;
import com.sky.sys.dao.FieldDao;
import com.sky.sys.dao.GeneralPurposeDao;
import com.sky.sys.dao.TableDao;
import com.sky.sys.po.*;
import com.sky.sys.server.ConfigurationPageServer;
import com.sky.sys.server.GeneralPurposeServer;
import com.sky.tool.UUIDTool;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Created by Administrator on 2017/12/30.
 */
@Service
public class GeneralPurposeServerImpl extends BaseServerImpl implements GeneralPurposeServer {

    @Autowired
    private GeneralPurposeDao generalPurposeDao;

    public List<Map<String,Object>> getTree2(String configurationPageCoding){
        GeneralPurpose generalPurpose = getGeneralPurpose(configurationPageCoding);
        System.out.println(generalPurpose.getTableEn());
        System.out.println(generalPurpose.getId());
        System.out.println(generalPurpose.getChildField());
        System.out.println(generalPurpose.getFieldList());
        //generalPurpose.setTableEn("s_menu");
       // generalPurpose.setId("coding");
       // generalPurpose.setChildField("superior_coding");
        //List<String> fieldList = new ArrayList<String>();
        //fieldList.add("coding");
        //fieldList.add("name");
        //fieldList.add("superior_coding");
        //generalPurpose.setFieldList(fieldList);
        //List<Find> findList = new ArrayList<Find>();
        //Find find = new Find();
//        find.setField("superior_coding");
//        find.setType("is_null");
//        findList.add(find);
//        generalPurpose.setFindList(findList);
//        List<Map<String,Object>> mapList = generalPurposeDao.findByCondition(generalPurpose);
//        //tree(mapList,generalPurpose);
//        System.out.println(mapList);
        return null;
    }

}
