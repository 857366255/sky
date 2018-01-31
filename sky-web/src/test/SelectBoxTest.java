import base.SpringTestCase;
import com.sky.admin.po.EditField;
import com.sky.admin.po.ListFind;
import com.sky.page.dao.PageDao;
import com.sky.page.dao.SelectBoxDao;
import org.apache.commons.lang3.builder.Diffable;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * Created by Administrator on 2017/12/30.
 */

@Component("configInfo")
public class SelectBoxTest extends SpringTestCase {

    @Autowired
    private SelectBoxDao selectBoxDao;



    @Test
    public void getSelectBox(){
        System.out.println("下拉框");
        System.out.println(selectBoxDao.getSelectBox("1"));
        Boolean si = false;
        System.out.println(si.equals(false));
    }

    @Test
    public void getSelectBoxShowFields(){
        System.out.println("下拉框显示字段");
        System.out.println(selectBoxDao.getSelectBoxShowFields("1"));
    }
}
