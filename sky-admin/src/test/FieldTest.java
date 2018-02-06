import base.SpringTestCase;
import com.sky.admin.dao.FieldDao;
import com.sky.admin.vo.EditField;
import com.sky.admin.po.Field;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class FieldTest extends SpringTestCase {

    @Autowired
    private FieldDao fieldDao;
    private Field field = new Field();
    private List<String> ele = new ArrayList<String>();

    @Test
    public void findAll(){
        System.out.println("查询");
        System.out.println(fieldDao.findAll());
    }

    @Test
    public void findByCondition(){
        System.out.println("按条件查询");

        field.setName("配置");
        System.out.println(fieldDao.findByCondition(field));
    }
    @Test
    public void doAdd(){
        System.out.println("新增");
        field.setCoding("4563");
        field.setName("配置");
        System.out.println(fieldDao.doAdd(field));
    }
    @Test
    public void doUpdate(){
        System.out.println("修改");
        field.setCoding("4563");
        field.setName("配置123");
        System.out.println(fieldDao.doUpdate(field));
    }
    @Test
    public void doDelete(){
        System.out.println("删除");
        System.out.println(fieldDao.doDelete("4563"));
    }

    @Test
    public void doDeleteBatch(){
        System.out.println("删除");
        ele.add("4563");
        ele.add("456");
        System.out.println(fieldDao.doDeleteBatch(ele));
    }
}
