import base.SpringTestCase;
import com.sky.admin.dao.EditFieldDao;
import com.sky.admin.vo.EditField;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class EditFieldTest extends SpringTestCase {

    @Autowired
    private EditFieldDao editFieldDao;
    private EditField ef = new EditField();
    private List<String> ele = new ArrayList<String>();

    @Test
    public void findAll(){
        System.out.println("查询");
        System.out.println(editFieldDao.findAll());
    }

    @Test
    public void findByCondition(){
        System.out.println("按条件查询");

        ef.setName("配置");
        System.out.println(editFieldDao.findByCondition(ef));
    }
    @Test
    public void doAdd(){
        System.out.println("新增");
        ef.setCoding("4563");
        ef.setName("配置");
        System.out.println(editFieldDao.doAdd(ef));
    }
    @Test
    public void doUpdate(){
        System.out.println("修改");
        ef.setCoding("4563");
        ef.setName("配置123");
        System.out.println(editFieldDao.doUpdate(ef));
    }
    @Test
    public void doDelete(){
        System.out.println("删除");
        System.out.println(editFieldDao.doDelete("4563"));
    }

    @Test
    public void doDeleteBatch(){
        System.out.println("删除");
        ele.add("4563");
        ele.add("456");
        System.out.println(editFieldDao.doDeleteBatch(ele));
    }
}
