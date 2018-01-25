import base.SpringTestCase;
import com.sky.page.dao.PageDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class PageTest extends SpringTestCase {

    @Autowired
    private PageDao pageDao;
    @Test
    public void getListField(){
        System.out.println("查询");
        System.out.println(pageDao.getListFields(""));
    }
}
