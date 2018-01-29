import base.SpringTestCase;
import com.sky.admin.po.EditField;
import com.sky.admin.po.ListFind;
import com.sky.page.dao.PageDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class ListFieldTest extends SpringTestCase {

    @Autowired
    private PageDao listFieldDao;


    @Test
    public void getEditField(){
        System.out.println("编辑字段");
        System.out.println(listFieldDao.getEditFields("1"));
    }
    @Test
    public void getListData(){
        System.out.println("列表数据");
        List<ListFind> listFinds =  listFieldDao.getListFinds("1");
        for(ListFind listFind : listFinds){
            listFind.setValue("1");
        }
        System.out.println(listFieldDao.getListDatas("s_menu",listFieldDao.getListFields("1"),listFinds));
    }
    @Test
    public void getListFind(){
        System.out.println("列表查询");
        System.out.println(listFieldDao.getListFinds("1"));
    }
    @Test
    public void getListField(){
        System.out.println("列表显示字段");
        System.out.println(listFieldDao.getListFields("1"));
    }
}
