package com.sky.production.service;

import com.sky.production.po.DeviceType;
import com.sky.production.po.Section;

import java.util.Map;

/**
 * Created by wz on 2018/3/27.
 */
public interface SectionService {
    Map<String,Object> getParams(Integer limit, Integer page, Section section);
    Boolean doAdd(Section section);
    Section findById(Integer id);
    Boolean doUpdate(Section section);
    Boolean doDelete(Integer id);
}
