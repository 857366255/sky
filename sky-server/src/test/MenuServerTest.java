import base.SpringTestCase;
import com.sky.sys.dao.MenuDao;
import com.sky.sys.po.Menu;
import com.sky.sys.server.MenuServer;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class MenuServerTest extends SpringTestCase {

    @Autowired
    private MenuServer menuServer;
    @Test
    public void add(){
        System.out.println("添加");
        Menu menu = new Menu();
        System.out.println(menuServer.doCreate(menu));
    }
    @Test
    public void findMenuList(){
        System.out.println("菜单栏列表");
        System.out.println(menuServer.findMenuList());
    }
}
