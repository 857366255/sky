import base.SpringTestCase;
import com.sky.page.dao.PageDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class ListFieldTest extends SpringTestCase {

    @Autowired
    private PageDao listFieldDao;
    @Test
    public void getListField(){
        System.out.println("查询");
        System.out.println(listFieldDao.getListFields(""));
    }
}
