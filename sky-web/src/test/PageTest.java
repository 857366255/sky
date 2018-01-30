import base.SpringTestCase;
import com.sky.admin.po.EditField;
import com.sky.admin.po.ListFind;
import com.sky.page.dao.PageDao;
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
public class PageTest extends SpringTestCase {

    @Autowired
    private PageDao pageDao;
    @Test
    public void doDelete(){
        System.out.println("删除");
        Map<String,Object> findMap = new HashMap<String, Object>();
        findMap.put("coding","456");
        findMap.put("name","22");
        System.out.println(pageDao.doDelete("s_menu",findMap));
    }

    @Test
    public void doUpdate(){
        System.out.println("修改");
        Map<String,Object> dataMap = new HashMap<String, Object>();
        Map<String,Object> findMap = new HashMap<String, Object>();
        dataMap.put("coding","");
        dataMap.put("name","1321312");
        dataMap.put("icon","");
        CopyOnWriteArrayList<EditField> editFields = new CopyOnWriteArrayList<EditField>(pageDao.getEditFields("1"));
        for (EditField editField : editFields) {
            String fieldEn = editField.getFieldEn();
            Object temp = dataMap.get(fieldEn);
            if(fieldEn.equals("coding")){
                findMap.put(fieldEn,temp);
                editFields.remove(editField);//删除多余查询条件
                continue;
            }else if(temp==null){//前台传入的查询条件为空时
                editFields.remove(editField);//删除多余查询条件
                continue;
            }
            editField.setValue(temp);//添加查询值
        }
        System.out.println(editFields);
        System.out.println(findMap);
        System.out.println(pageDao.doUpdate("s_menu",editFields,findMap));
    }

    @Test
    public void getEidtData(){
        System.out.println("获得编辑数据");
        List<EditField> editFields = pageDao.getEditFields("1");
        Map<String,Object> idMap = new HashMap<String, Object>();
        idMap.put("coding","456");
        System.out.println(idMap.isEmpty());
        System.out.println(pageDao.getEidtData("s_menu",idMap,editFields));
    }
    @Test
    public void doAdd(){
        System.out.println("新增");
        List<EditField> editFields = new ArrayList<EditField>();
        EditField ef = new EditField();
        ef.setFieldEn("coding");
        ef.setValue("222");
        editFields.add(ef);
        System.out.println(pageDao.doAdd("s_menu", editFields));
    }
    @Test
    public void getEditField(){
        System.out.println("编辑字段");
        System.out.println(pageDao.getEditFields("1"));
    }
    @Test
    public void getListData(){
        System.out.println("列表数据");
        List<ListFind> listFinds =  pageDao.getListFinds("1");
        for(ListFind listFind : listFinds){
            listFind.setValue("1");
        }
        System.out.println(pageDao.getListDatas("s_menu",pageDao.getListFields("1"),listFinds));
    }
    @Test
    public void getListFind(){
        System.out.println("列表查询");
        System.out.println(pageDao.getListFinds("1"));
    }
    @Test
    public void getListField(){
        System.out.println("列表显示字段");
        System.out.println(pageDao.getListFields("1"));
    }
}
