/**
 * Created by wz on 2017/7/6.
 */

import base.SpringTestCase;
import com.sky.sys.dao.ConfigurationPageDao;
import com.sky.sys.dao.FieldDao;
import com.sky.sys.dao.MenuDao;
import com.sky.sys.dao.TableDao;
import com.sky.sys.po.Field;
import com.sky.sys.po.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**
 * 功能概要：单元测试
 */
@Component("configInfo")
public class MenuDaoTest extends SpringTestCase {

    @Autowired
    private MenuDao menuDao;

    @org.junit.Test
    public void tsstFind(){
        System.out.println(menuDao.findMenuList());
        System.out.println(menuDao.findMenuList().get(0).getName());
    }

    @org.junit.Test
    public void tsstAdd(){
        System.out.println("新增");
        Menu menu = new Menu();
        menu.setCoding("ba");
        menu.setConfigurationPageCoding(null);
        menu.setDisplayStyle(null);
        menu.setEnablement(null);
        menu.setIcon(null);
        menu.setName(null);
        menu.setSorting(1);
        menu.setSuperiorCoding(null);
        menu.setUrl(null);
        /*for(int i=0;i<2;i++){
            menu.setCoding("aaa"+i);
            menu.setConfigurationPageCoding(null);
            menu.setDisplayStyle("das"+i);
            menu.setEnablement(false);
            menu.setIcon("ad"+i);
            menu.setName("看"+i);
            menu.setSorting(i);
            menu.setSuperiorCoding(null);
            menu.setUrl("uil");
            System.out.println(menuDao.doCreate(menu));
        }*/
        System.out.println(menuDao.doCreate(menu));
    }

    @org.junit.Test
    public void tsstUpdate(){
       Menu menu = new Menu();
        menu.setCoding("ba");
        menu.setConfigurationPageCoding(null);
        menu.setDisplayStyle(null);
        menu.setEnablement(null);
        menu.setIcon(null);
        menu.setName(null);
        menu.setSorting(1);
        menu.setSuperiorCoding(null);
        menu.setUrl(null);
        System.out.println(menuDao.doUpdate(menu));
    }
    @org.junit.Test
    public void doRemove(){
        System.out.println("删除");
        System.out.println(menuDao.doRemove("menu"));
    }
}