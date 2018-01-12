/**
 * Created by wz on 2017/7/6.
 */

import base.SpringTestCase;
import com.sky.sys.dao.ConfigurationPageDao;
import com.sky.sys.dao.FieldDao;
import com.sky.sys.dao.MenuDao;
import com.sky.sys.dao.TableDao;
import com.sky.sys.po.ConfigurationPage;
import com.sky.sys.po.Field;
import com.sky.sys.po.Menu;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**
 * 功能概要：单元测试
 */
@Component("configInfo")
public class ConfigurationPageDaoTest extends SpringTestCase {

    @Autowired
    private ConfigurationPageDao configurationPageDao;

    @Test
    public void findTest(){
        System.out.println("查询");
        System.out.println(configurationPageDao.findById("a"));

    }

    @org.junit.Test
    public void tsstAdd(){
        System.out.println("新增");

        ConfigurationPage configurationPage = new ConfigurationPage();
        configurationPage.setCoding("HWAS21123123");
        configurationPage.setListHeight(1000);
        configurationPage.setListRows(20);
        configurationPage.setName("坤");
        configurationPage.setQuerysStyle("assad");
        configurationPage.setShownQuerys(true);
        configurationPage.setSlaveHeight(500);
        configurationPage.setTableEn("s_asd");
        configurationPage.setSlaveRows(10);
        System.out.println(configurationPageDao.doCreate(configurationPage));

    }

    @org.junit.Test
    public void tsstUpdate(){
        System.out.println("更新");
        ConfigurationPage configurationPage = new ConfigurationPage();
        configurationPage.setCoding("HWAS21123123");
        configurationPage.setListHeight(2000);
        configurationPage.setListRows(50);
        configurationPage.setName("坤123");
        configurationPage.setQuerysStyle("adadasdadasdasda");
        configurationPage.setShownQuerys(false);
        configurationPage.setSlaveHeight(1500);
        configurationPage.setTableEn("s_asd");
        configurationPage.setSlaveRows(100);
        System.out.println(configurationPageDao.doUpdate(configurationPage));
    }
    @org.junit.Test
    public void doRemove(){
        System.out.println("删除");
        System.out.println(configurationPageDao.doRemove("HWAS21123123"));
    }
}