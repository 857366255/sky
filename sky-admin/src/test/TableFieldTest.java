import base.SpringTestCase;
import com.sky.admin.dao.ConfigurationPageDao;
import com.sky.admin.dao.FieldDao;
import com.sky.admin.po.ConfigurationPage;
import com.sky.admin.po.Field;
import com.sky.admin.po.TableField;
import com.sky.admin.service.TableFieldService;
import com.sky.admin.vo.Limit;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class TableFieldTest extends SpringTestCase {

    @Autowired
    private TableFieldService tableFieldService;
    private TableField tableField = new TableField();
    @Test
    public void test1(){
        tableFieldService.updateTableField();
    }


}
