import base.SpringTestCase;
import com.sky.sys.dao.ConfigurationPageDao;
import com.sky.sys.po.ConfigurationPage;
import com.sky.sys.po.Menu;
import com.sky.sys.server.ConfigurationPageServer;
import com.sky.sys.server.MenuServer;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class ConfigurationPageServerTest extends SpringTestCase {

    @Autowired
    private ConfigurationPageServer configurationPageServer;

    @Test
    public void editParams() {
        configurationPageServer.getEditParams("ffae5b0d-c1b7-4f0d-9257-b97f5eda7532");
    }

    @Test
    public void addConfigurationPage(){
        System.out.println("创建配置页面信息");
        ConfigurationPage configurationPage = new ConfigurationPage();
        configurationPage.setCoding("HWAS21123123");
        configurationPage.setListHeight(1000);
        configurationPage.setListRows(20);
        configurationPage.setName("坤");
        configurationPage.setQuerysStyle("assad");
        configurationPage.setShownQuerys(true);
        configurationPage.setSlaveHeight(500);
        configurationPage.setTableEn("s_menu");
        configurationPage.setSlaveRows(10);
        configurationPageServer.addConfigurationPageInformation(configurationPage);
        System.out.println("结束创建");
    }

    @Test
    public void findConfigurationPage(){
        System.out.println("菜单栏列表");
        System.out.println(configurationPageServer.getListParams("0f569b93-f69f-453e-a7c2-07394a89e446"));
    }
}
