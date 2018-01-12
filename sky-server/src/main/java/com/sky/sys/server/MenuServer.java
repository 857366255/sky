package com.sky.sys.server;

import com.sky.sys.po.Menu;

import java.util.List;

/**
 * Created by Administrator on 2017/12/30.
 */
public interface MenuServer {
    public Boolean doCreate(Menu menus);
    public List<Menu> findMenuList();
}
