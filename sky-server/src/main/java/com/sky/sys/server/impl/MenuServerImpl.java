package com.sky.sys.server.impl;

import com.sky.sys.dao.MenuDao;
import com.sky.sys.po.Menu;
import com.sky.sys.server.MenuServer;
import com.sky.tool.UUIDTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/30.
 */
@Service
public class MenuServerImpl implements MenuServer {

    @Autowired
    private MenuDao menuDao;

    public Boolean doCreate(Menu menu) {
        menu.setCoding(UUIDTool.getUUID());
        return menuDao.doCreate(menu);
    }

    public List<Menu> findMenuList() {
        return menuDao.findMenuList();
    }
}
