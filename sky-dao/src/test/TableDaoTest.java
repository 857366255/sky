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
import com.sky.sys.po.Table;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**
 * 功能概要：单元测试
 */
@Component("configInfo")
public class TableDaoTest extends SpringTestCase {

    @Autowired
    private TableDao tableDao;

    @Test
    public void findConfigurationPagTable(){
        System.out.println("查询");
        System.out.println(tableDao.findByConfigurationPageCoding("a"));
    }

    @Test
    public void findTest(){
        System.out.println("查询");
        System.out.println(tableDao.findMasterTableList());
    }

    @org.junit.Test
    public void tsstAdd(){
        System.out.println("新增");
        Table table = new Table();
        table.setCoding("c");
        table.setAnnotation("是");
        table.setConfigurationPageCoding(null);
        table.setCorrelateField("aa");
        table.setName("发");
        table.setSlaveSorting(1);
        table.setType("master");
        table.setTableEn("res");
        table.setSuperiorCoding(null);
        table.setSuperiorCorrelateField("aass");
        System.out.println(tableDao.doCreate(table));

    }

    @org.junit.Test
    public void tsstUpdate(){
        System.out.println("更新");
        Table table = new Table();
        table.setCoding("c");
        table.setAnnotation(null);
        table.setConfigurationPageCoding(null);
        table.setCorrelateField(null);
        table.setName(null);
        table.setSlaveSorting(null);
        table.setType(null);
        table.setTableEn(null);
        table.setSuperiorCoding(null);
        table.setSuperiorCorrelateField(null);
        System.out.println(tableDao.doUpdate(table));
    }
    @org.junit.Test
    public void doRemove(){
        System.out.println("删除");
        System.out.println(tableDao.doRemove("cc"));
    }
}