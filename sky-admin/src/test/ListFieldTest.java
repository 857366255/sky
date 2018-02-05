import base.SpringTestCase;
import com.sky.admin.dao.ConfigurationPageDao;
import com.sky.admin.dao.ListFieldDao;
import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.po.ListField;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class ListFieldTest extends SpringTestCase {

    @Autowired
    private ListFieldDao listFieldDao;
    private ListField  lf = new ListField();
    private List<String> ele = new ArrayList<String>();

    @Test
    public void findAll(){
        System.out.println("查询");
        System.out.println(listFieldDao.findAll());
    }

    @Test
    public void findByCondition(){
        System.out.println("按条件查询");

        lf.setName("配置");
        System.out.println(listFieldDao.findByCondition(lf));
    }
    @Test
    public void doAdd(){
        System.out.println("新增");
        lf.setCoding("4563");
        lf.setName("配置");
        System.out.println(listFieldDao.doAdd(lf));
    }
    @Test
    public void doUpdate(){
        System.out.println("修改");
        lf.setCoding("4563");
        lf.setName("配置123");
        System.out.println(listFieldDao.doUpdate(lf));
    }
    @Test
    public void doDelete(){
        System.out.println("删除");
        System.out.println(listFieldDao.doDelete("4563"));
    }

    @Test
    public void doDeleteBatch(){
        System.out.println("删除");
        ele.add("4563");
        ele.add("456");
        System.out.println(listFieldDao.doDeleteBatch(ele));
    }
}
