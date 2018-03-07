import base.SpringTestCase;
import com.sky.fitness.dao.VipDao;
import com.sky.fitness.po.Vip;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by wz on 2018/3/7.
 */
@Component("configInfo")
public class VipTest extends SpringTestCase {

        @Autowired
        private VipDao vipDao;

    @Test
    public void add(){
        Vip vip = new Vip();
        vip.setContact("123456789");
        vip.setName("zxc");
        vipDao.doAdd(vip);
    }
}
