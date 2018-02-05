import base.SpringTestCase;
import com.sky.admin.dao.ConfigurationPageDao;
import com.sky.admin.po.ConfigurationPage;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class ConfigurationPageTest extends SpringTestCase {

    @Autowired
    private ConfigurationPageDao configurationPageDao;
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
