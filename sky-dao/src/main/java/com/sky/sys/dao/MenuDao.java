package com.sky.sys.dao;

import com.sky.sys.po.Menu;

import java.util.List;

/**
 * Created by Administrator on 2017/12/17.
 */
public interface MenuDao extends BaseDao<String, Menu> {
    /**
     * 获取菜单栏列表
     * @return 菜单栏列表
     */
    public List<Menu> findMenuList();
}
