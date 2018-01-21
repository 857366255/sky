import base.SpringTestCase;
import com.sky.sys.dao.GeneralPurposeDao;
import com.sky.sys.po.ConfigurationPage;
import com.sky.sys.po.Find;
import com.sky.sys.po.GeneralPurpose;
import com.sky.sys.server.BaseServer;
import com.sky.sys.server.ConfigurationPageServer;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class GeneralPurposeServerTest extends SpringTestCase {

    @Autowired
    private GeneralPurposeDao generalPurposeDao;
    @Autowired
    private BaseServer baseServer;


    @Test
    public void test(){
        System.out.println("查询递归");
        baseServer.getTree("asd",4);
    }
    @Test
    public void getTableId(){
        String configurationPageCoding ="s_menu-1";
        String tableEn ="s_menu";
        GeneralPurpose gp = new GeneralPurpose("s_table","coding");
        List<String> fieldList = new ArrayList<String>();
        fieldList.add("table_id");
        gp.setFieldList(fieldList);
        List<Find> findList = new ArrayList<Find>();
        findList.add( new Find("configuration_page_coding",configurationPageCoding,"equal") );
        findList.add( new Find("table_en",tableEn,"equal") );
        gp.setFindList(findList);
        List<Map<String,Object>> list = generalPurposeDao.findByCondition(gp);
        if(list==null || list.size()!=1){
            System.out.println("错误:表没有主键或者有多个");
            //return null;
        }
        System.out.println(list.get(0).get("table_id").toString());
    }
    @Test
    public void getTableEn(){
        String configurationPageCoding ="s_menu-1";
        GeneralPurpose gp = new GeneralPurpose("s_configuration_page","coding");
        List<String> fieldList = new ArrayList<String>();
        fieldList.add("table_en");
        gp.setFieldList(fieldList);
        gp.setFindId(configurationPageCoding);
        Map<String,Object> map = generalPurposeDao.findById(gp);
        System.out.println(map);
    }
    @Test
    public void getListField(){
        String configurationPageCoding ="s_menu-1";
        List<String> list = new ArrayList<String>();
        GeneralPurpose generalPurpose = new GeneralPurpose("s_field","coding");
        List<String> fieldList = new ArrayList<String>();
        fieldList.add("field_en");
        generalPurpose.setFieldList(fieldList);
        List<Find> findList = new ArrayList<Find>();
        findList.add( new Find("configuration_page_coding",configurationPageCoding,"equal") );
        generalPurpose.setFindList(findList);
        generalPurpose.setFindId(configurationPageCoding);
        List<Map<String,Object>> mapList = generalPurposeDao.findByCondition(generalPurpose);
        for(Map<String,Object>map:mapList){
            list.add(map.get("field_en").toString());
        }
        System.out.println(list);
    }
    @Test
    public void getGeneralPurposeTest(){
        String configurationPageCoding ="s_menu-1";
        GeneralPurpose generalPurpose = new GeneralPurpose();
        generalPurpose.setTableEn("s_configuration_page");
        generalPurpose.setId("coding");
        List<String> fieldList = new ArrayList<String>();
        fieldList.add("coding");
        fieldList.add("name");
        fieldList.add("table_en");
        generalPurpose.setFieldList(fieldList);
        generalPurpose.setFindId(configurationPageCoding);
        Map<String,Object> map = generalPurposeDao.findById(generalPurpose);
        System.out.println(map);
    }


}
