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
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**
 * 功能概要：单元测试
 */
@Component("configInfo")
public class FieldDaoTest extends SpringTestCase {

    @Autowired
    private FieldDao fieldDao;

    @Test
    public void findTest(){
        System.out.println("查询");
        System.out.println(fieldDao.findByTableCoding("asd"));

    }

    @org.junit.Test
    public void tsstAdd(){
        System.out.println("新增");
        Field field = new Field();
        field.setCoding("dddd");
        field.setName("asd");
        field.setConfigurationPageCoding(null);
        field.setTableCoding("a");
        field.setField("asd");
        field.setAnnotation("as");
        field.setType("ads");
        field.setSize(0);
        field.setInputType("ad");
        field.setEdit(false);
        field.setMust(false);
        field.setEditAnnotation("asd");
        field.setEditSorting(1);
        field.setShowList(false);
        field.setListWidth(2);
        field.setListSorting(3);
        field.setQuerySorting(4);
        field.setQuery(false);
        field.setQueryOccupy(0);
        field.setShowSlave(false);
        field.setSlaveWidth(5);
        field.setSlaveSorting(6);
        System.out.println(fieldDao.doCreate(field));
    }

    @org.junit.Test
    public void tsstUpdate(){
        System.out.println("更新");
        Field field = new Field();
        field.setCoding("dd");
        field.setName(null);
        field.setConfigurationPageCoding(null);
        field.setTableCoding(null);
        field.setField(null);
        field.setAnnotation(null);
        field.setType(null);
        field.setSize(null);
        field.setInputType(null);
        field.setEdit(null);
        field.setMust(null);
        field.setEditAnnotation(null);
        field.setEditSorting(null);
        field.setShowList(null);
        field.setListWidth(null);
        field.setListSorting(null);
        field.setQuerySorting(null);
        field.setQuery(null);
        field.setQueryOccupy(null);
        field.setShowSlave(null);
        field.setSlaveWidth(null);
        field.setSlaveSorting(null);
        System.out.println(fieldDao.doUpdate(field));
    }
    @org.junit.Test
    public void doRemove(){
        System.out.println("删除");
        System.out.println(fieldDao.doRemove("dd"));
    }
}