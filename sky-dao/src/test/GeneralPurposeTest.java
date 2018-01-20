/**
 * Created by wz on 2017/7/6.
 */

import base.SpringTestCase;
import com.sky.sys.dao.GeneralPurposeDao;
import com.sky.sys.po.Find;
import com.sky.sys.po.GeneralPurpose;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 功能概要：单元测试
 */
@Component("configInfo")
public class GeneralPurposeTest extends SpringTestCase {

    @Autowired
    private GeneralPurposeDao generalPurposeDao;

    @Test
    public void findTest(){
        System.out.println("查询");
        GeneralPurpose generalPurpose = new GeneralPurpose();
        generalPurpose.setTableEn("s_menu");
        List<String> fieldList = new ArrayList<String>();
        fieldList.add("coding");
        fieldList.add("name");
        generalPurpose.setFieldList(fieldList);
        List<Find> findList = new ArrayList<Find>();
        Find find = new Find();
        find.setField("name");
        find.setValue("管理");
        find.setType("equal");
        findList.add(find);
        findList.add(find);
        generalPurpose.setFindList(findList);
        System.out.println(generalPurposeDao.findByCondition(generalPurpose));

    }

    @Test
    public void addTest(){
        System.out.println("新增");
        GeneralPurpose generalPurpose = new GeneralPurpose();
        generalPurpose.setTableEn("s_menu");
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("coding","213");
        generalPurpose.setCreateMap(map);
        System.out.println(generalPurposeDao.doCreate(generalPurpose));

    }
    @Test
    public void updateTest(){
        System.out.println("更新");
        GeneralPurpose generalPurpose = new GeneralPurpose();
        generalPurpose.setTableEn("s_menu");
        generalPurpose.setId("coding");
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("coding","213");
        map.put("name","1323");
        generalPurpose.setUpdateMap(map);
        System.out.println(generalPurposeDao.doUpdate(generalPurpose));

    }
    @Test
    public void doRemove(){
        System.out.println("删除");
        GeneralPurpose generalPurpose = new GeneralPurpose();
        generalPurpose.setTableEn("s_menu");;
        List<Find> findList = new ArrayList<Find>();
        Find find = new Find();
        find.setField("coding");
        find.setValue("213");
        find.setType("equal");
        findList.add(find);
        generalPurpose.setFindList(findList);
        System.out.println(generalPurposeDao.doRemove(generalPurpose));

    }

}