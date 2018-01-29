import base.SpringTestCase;
import com.sky.admin.po.EditField;
import com.sky.admin.po.ListFind;
import com.sky.page.dao.PageDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class ListFieldTest extends SpringTestCase {

    @Autowired
    private PageDao pageDao;

    @Test
    public void doAdd(){
        System.out.println("新增");
        List<EditField> editFields = new ArrayList<EditField>();
        EditField ef = new EditField();
        ef.setFieldEn("coding");
        ef.setValue("222");
        editFields.add(ef);
        System.out.println(pageDao.doAdd("s_menu", editFields));
    }
    @Test
    public void getEditField(){
        System.out.println("编辑字段");
        System.out.println(pageDao.getEditFields("1"));
    }
    @Test
    public void getListData(){
        System.out.println("列表数据");
        List<ListFind> listFinds =  pageDao.getListFinds("1");
        for(ListFind listFind : listFinds){
            listFind.setValue("1");
        }
        System.out.println(pageDao.getListDatas("s_menu",pageDao.getListFields("1"),listFinds));
    }
    @Test
    public void getListFind(){
        System.out.println("列表查询");
        System.out.println(pageDao.getListFinds("1"));
    }
    @Test
    public void getListField(){
        System.out.println("列表显示字段");
        System.out.println(pageDao.getListFields("1"));
    }
}
