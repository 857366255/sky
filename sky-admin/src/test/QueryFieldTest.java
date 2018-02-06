import base.SpringTestCase;
import com.sky.admin.dao.QueryFieldDao;
import com.sky.admin.vo.QueryField;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class QueryFieldTest extends SpringTestCase {

    @Autowired
    private QueryFieldDao queryFieldDao;
    private QueryField qf = new QueryField();
    private List<String> ele = new ArrayList<String>();

    @Test
    public void findAll(){
        System.out.println("查询");
        System.out.println(queryFieldDao.findAll());
    }

    @Test
    public void findByCondition(){
        System.out.println("按条件查询");

        qf.setName("配置");
        System.out.println(queryFieldDao.findByCondition(qf));
    }
    @Test
    public void doAdd(){
        System.out.println("新增");
        qf.setCoding("4563");
        qf.setName("配置");
        System.out.println(queryFieldDao.doAdd(qf));
    }
    @Test
    public void doUpdate(){
        System.out.println("修改");
        qf.setCoding("4563");
        qf.setName("配置123");
        System.out.println(queryFieldDao.doUpdate(qf));
    }
    @Test
    public void doDelete(){
        System.out.println("删除");
        System.out.println(queryFieldDao.doDelete("4563"));
    }

    @Test
    public void doDeleteBatch(){
        System.out.println("删除");
        ele.add("4563");
        ele.add("456");
        System.out.println(queryFieldDao.doDeleteBatch(ele));
    }
}
