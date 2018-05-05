package com.sky.demo.service.impl;

import com.sky.demo.dao.MenuDao;
import com.sky.demo.po.Menu;
import com.sky.demo.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wz on 2018/2/6.
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuDao menuDao;

    public List<Menu> findMenus(){
        return menuDao.findMenus();
    }


}
