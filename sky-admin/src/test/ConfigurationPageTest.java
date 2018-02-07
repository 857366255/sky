import base.SpringTestCase;
import com.sky.admin.dao.ConfigurationPageDao;
import com.sky.admin.dao.FieldDao;
import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.po.Field;
import com.sky.admin.service.ConfigurationPageService;
import com.sky.admin.vo.ListField;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class ConfigurationPageTest extends SpringTestCase {

    @Autowired
    private ConfigurationPageDao configurationPageDao;
    @Autowired
    private FieldDao fieldDao;
    @Autowired
    private ConfigurationPageService configurationPageService;

    private Field field = new Field();

    @Test
    public void getConfigurationPage(){
        System.out.println("获得配置页面");
        System.out.println(configurationPageDao.getConfigurationPage("s_menu2"));
    }

    @Test
    public void doUpdate2(){
        System.out.println("修改2");
        ConfigurationPage cp = new ConfigurationPage();
        cp.setCoding("s_menu2");
        cp.setTableEn("s_configuration_page");
        cp.setName("配置123");
        System.out.println(configurationPageService.doUpdate(cp));
    }
    @Test
    public void doAdd2(){
        System.out.println("新增2");
        ConfigurationPage cp = new ConfigurationPage();
        cp.setCoding("s_menu2");
        cp.setTableEn("s_menu");
        cp.setName("菜单栏");
        configurationPageService.doAdd(cp);
    }
    @Test
    public void doDelete2(){
        System.out.println("删除2");
        System.out.println(configurationPageService.doDelete("s_menu2"));
    }

    @Test
    public void findAll(){
        System.out.println("查询");
        System.out.println(configurationPageDao.findAll());
    }

    @Test
    public void findByCondition(){
        System.out.println("按条件查询");
        ConfigurationPage cp = new ConfigurationPage();
        cp.setName("配置");
        System.out.println(configurationPageDao.findByCondition(cp));
    }
    @Test
    public void doAdd(){
        System.out.println("新增");
        ConfigurationPage cp = new ConfigurationPage();
        cp.setCoding("4563");
        cp.setName("配置");
        System.out.println(configurationPageDao.doAdd(cp));
    }
    @Test
    public void doUpdate(){
        System.out.println("修改");
        ConfigurationPage cp = new ConfigurationPage();
        cp.setCoding("4563");
        cp.setName("配置123");
        System.out.println(configurationPageDao.doUpdate(cp));
    }
    @Test
    public void doDelete(){
        System.out.println("删除");
        System.out.println(configurationPageDao.doDelete("4563"));
    }

    @Test
    public void doDeleteBatch(){
        System.out.println("删除");
        List<String> ele = new ArrayList<String>();
        ele.add("4563");
        ele.add("456");
        System.out.println(configurationPageDao.doDeleteBatch(ele));
    }
}
