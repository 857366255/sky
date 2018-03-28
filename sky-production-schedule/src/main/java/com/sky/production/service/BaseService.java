package com.sky.production.service;

import java.util.List;
import java.util.Map;

/**
 * Created by wz on 2018/3/28.
 */
public interface BaseService<K,V> {
    Map<String,Object> getParams(Integer limit, Integer  page, V vo);
    Boolean doAdd(V vo);
    V findById(K id);
    Boolean doUpdate(V vo);
    Boolean doDelete(K id);
    List<V> findAll();
}
