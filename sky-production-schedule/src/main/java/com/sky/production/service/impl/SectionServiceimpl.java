package com.sky.production.service.impl;

import com.sky.admin.vo.Limit;
import com.sky.production.dao.DeviceTypeDao;
import com.sky.production.dao.SectionDao;
import com.sky.production.po.DeviceType;
import com.sky.production.po.Section;
import com.sky.production.service.DevicetypeService;
import com.sky.production.service.SectionService;
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
public class SectionServiceimpl implements SectionService {

    @Autowired
    private SectionDao sectionDao;

    public Map<String,Object> getParams(Integer limit, Integer  page, Section section){
        Map<String,Object> params =  new HashMap<String, Object>();
        params.put("code","0");
        params.put("count",sectionDao.countData(new Section()));
        params.put("data",sectionDao.findData( new Limit(page, limit)  ,section));
        params.put("msg","SUCCESS");
        return  params;
    }

    @Transactional
    public Boolean doAdd(Section section) {
        return sectionDao.doAdd(section);
    }

    @Transactional
    public Section findById(Integer id){
        return sectionDao.findById(id);
    }

    @Transactional
    public Boolean doUpdate(Section section){
        return sectionDao.doUpdate(section);
    }

    @Transactional
    public Boolean doDelete(Integer id) {
        return sectionDao.doDelete(id);
    }

    public List<Section> findAll() {
        List<Section> sectionList = sectionDao.findAll();
        sectionList.add(0,new Section());
        return sectionList;
    }
}
