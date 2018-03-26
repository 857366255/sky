import base.SpringTestCase;

import com.sky.production.dao.BomDao;
import com.sky.production.dao.SectionDao;
import com.sky.production.po.Bom;
import com.sky.production.po.Section;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class DaoTest extends SpringTestCase {

    @Autowired
    private SectionDao sectionDao;

    private Section section = new Section();

    @Test
    public void doAdd(){
        section.setName("工段1");
        sectionDao.doAdd(section);
        sectionDao.doAdd(section);
        section = sectionDao.findById(1);
        System.out.println("查询id为1:"+section);
        section.setName("工段2");
        sectionDao.doUpdate(section);
        System.out.println("查询全部:"+sectionDao.findAll());
        sectionDao.doDelete(4);
        System.out.println("删除后查询:"+sectionDao.findAll());
    }
    @Test
    public void doUpdate(){

        section.setName("工段1");
        sectionDao.doUpdate(section);
    }
    @Test
    public void findAll(){
        System.out.println("查询");
        System.out.println(sectionDao.findAll());
    }


}
