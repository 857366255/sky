import base.SpringTestCase;

import com.sky.production.dao.ProcessDao;

import com.sky.production.po.Process;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class DaoTest extends SpringTestCase {

    @Autowired
    private ProcessDao processDao;

    private Process process = new Process();

    @Test
    public void doAdd(){
        process.setName("工段1");
        processDao.doAdd(process);
        processDao.doAdd(process);
        process = processDao.findById(1);
        System.out.println("查询id为1:"+process);
        process.setName("工段2");
        processDao.doUpdate(process);
        System.out.println("查询全部:"+processDao.findAll());
        processDao.doDelete(4);
        System.out.println("删除后查询:"+processDao.findAll());
    }
    @Test
    public void doUpdate(){

        process.setName("工段1");
        processDao.doUpdate(process);
    }
    @Test
    public void findAll(){
        System.out.println("查询");
        System.out.println(processDao.findAll());
    }


}
