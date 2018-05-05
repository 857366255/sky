package com.sky.demo.dao;


import com.sky.common.base.BaseDao;
import com.sky.demo.po.Menu;

import java.util.List;

/**
 * Created by wz on 2018/2/5.
 */
public interface MenuDao extends BaseDao<Integer ,Menu> {
    List<Menu> findMenus();
}
