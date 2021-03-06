package com.sky.sys.web;

import com.alibaba.fastjson.JSON;
import com.sdicons.json.mapper.MapperException;
import com.sky.admin.po.*;
import com.sky.page.dao.PageDao;
import com.sky.page.dao.SelectBoxDao;
import com.sky.admin.vo.Params;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * Created by Administrator on 2017/12/30.
 */
@Controller
public class TestController {

    @Autowired
    private PageDao pageDao;
    @Autowired
    private SelectBoxDao selectBoxDao;


    /**
     * 打主从页面
     * @param map
     * @return
     */
    @RequestMapping(value = "master-slave/{configurationPageCoding}/{id}",method = RequestMethod.GET)
    public String goMasterSlave(Map<String, Object> map,@PathVariable String configurationPageCoding, @PathVariable String id){
        Map<String,Object> listParams = getListParams(configurationPageCoding);
        listParams.put("url","../../listData/"+configurationPageCoding);//请求后台的URL
        List<ListFind> listFinds =  pageDao.getListFinds(configurationPageCoding);
        map.put("listParams", JSON.toJSONString(listParams));
        map.put("listFinds", listFinds);
        map.put("configurationPageCoding", configurationPageCoding);
        return "test/master-slave";
    }
    /**
     * 删除数据
     * @param configurationPageCoding
     */
    @RequestMapping(value={"delete/{configurationPageCoding}/{id}"},method=RequestMethod.DELETE)
    @ResponseBody
    public Boolean delete(@RequestParam Map<String, Object> map, @PathVariable String configurationPageCoding, @PathVariable String id){
        if(doRemove(configurationPageCoding,id)){
            System.out.println("删除成功");
            return true;
        }else{
            System.out.println("删除失败");
            return false;
        }
    }
    /**
     * 新增数据
     * @param map
     * @param configurationPageCoding
     * @return
     */
    @RequestMapping(value = "add/{configurationPageCoding}",method = RequestMethod.POST)
    public String add(@RequestParam Map<String, Object> map, @PathVariable String configurationPageCoding){
        System.out.println("新增");
        if(doAdd(configurationPageCoding,map)){
            System.out.println("保存成功");
        }else{
            System.out.println("保存失败");
        }
        System.out.println(map);
        List<EditField> editFields =  pageDao.getEditFields(configurationPageCoding);
        map.put("editFields", editFields);
        map.put("configurationPageCoding", configurationPageCoding);
        map.put("type", "add");
        return "redirect:../"+configurationPageCoding;
    }

    /**
     * 更新数据 doUpdate
     * @param map
     * @param configurationPageCoding
     * @param id
     * @return
     */
    @RequestMapping(value = "update/{configurationPageCoding}/{id}",method = RequestMethod.POST)
    public String update(@RequestParam Map<String, Object> map, @PathVariable String configurationPageCoding, @PathVariable String id){
        System.out.println("修改");
        if(doUpdate(configurationPageCoding,map)){
            System.out.println("修改成功");
        }else{
            System.out.println("修改失败");
        }
        List<EditField> editFields =  pageDao.getEditFields(configurationPageCoding);
        map.put("configurationPageCoding", configurationPageCoding);
        map.put("type", "update");
        map.put("editFields", editFields);
        return "redirect:"+id;
    }

    /**
     * 打开新增页面
     * @param map
     * @param configurationPageCoding
     * @return
     */
    @RequestMapping(value = "add/{configurationPageCoding}",method = RequestMethod.GET)
    public String goAdd(Map<String, Object> map, @PathVariable String configurationPageCoding){
        List<EditField> editFields =  pageDao.getEditFields(configurationPageCoding);

        for(EditField editField : editFields){
            SelectBox selectBox = editField.getSelectBox();
            if(selectBox!=null){
                System.out.println(selectBox);
                List<SelectBoxValue> selectBoxValue = selectBoxDao.getSelectBoxValues(selectBox);
                editField.setSelectBoxValues(selectBoxValue);
                System.out.println(selectBoxValue);
            }
        }
        map.put("editFields", editFields);
        map.put("configurationPageCoding", configurationPageCoding);
        map.put("type", "add");


        return "test/edit";
    }

    /**
     * 打开更新页面
     * @param configurationPageCoding
     * @param id
     * @param map
     * @return
     */
    @RequestMapping(value = "update/{configurationPageCoding}/{id}",method = RequestMethod.GET)
    public String goUpdate(@PathVariable String configurationPageCoding,@PathVariable String id, Map<String, Object> map){
        System.out.println("打开更新页面");

        List<EditField> editFields =  pageDao.getEditFields(configurationPageCoding);
        for(EditField editField : editFields){
            SelectBox selectBox = editField.getSelectBox();
            if(selectBox!=null){
                System.out.println(selectBox);
                List<SelectBoxValue> selectBoxValue = selectBoxDao.getSelectBoxValues(selectBox);
                editField.setSelectBoxValues(selectBoxValue);
                System.out.println(selectBoxValue);
            }
        }
        map.put("editFields", editFields);
        map.put("configurationPageCoding", configurationPageCoding);
        map.put("type", "update");
        map.put("id", id);
        Map<String,Object> idMap = new HashMap<String, Object>();
        idMap.put("coding",id);
        Map<String,Object> data = pageDao.getEidtData(pageDao.getConfigurationPage(configurationPageCoding).getTableEn(),idMap,editFields);
        map.put("data",data);

        return "test/edit";
    }
    /**
     * 打开列表页面
     * @param map
     * @return
     */
    @RequestMapping(value = "list/{configurationPageCoding}",method = RequestMethod.GET)
    public String goList(Map<String, Object> map,@PathVariable String configurationPageCoding){
        Map<String,Object> listParams = getListParams(configurationPageCoding);
        List<ListFind> listFinds =  pageDao.getListFinds(configurationPageCoding);
        map.put("listParams", JSON.toJSONString(listParams));
        map.put("listFinds", listFinds);
        map.put("configurationPageCoding", configurationPageCoding);
        return "test/list";
    }
    /**
     *获得数据
     */
    @RequestMapping(value="listData/{configurationPageCoding}", produces = "application/json; charset=utf-8" )
    @ResponseBody
    public List<Map<String, Object>> data(@PathVariable String configurationPageCoding, Params params) throws MapperException {
        System.out.println("获得数据:");
        System.out.println(params);
        return getListData(configurationPageCoding,  params.getQuery()==null ? null : params.getQuery());
    }

    private List<Map<String,Object>> getListData(String configurationPageCoding,Map<String,Object> findMap){
        if(findMap==null) findMap = new HashMap<String, Object>();
        CopyOnWriteArrayList<ListFind> listFinds = new CopyOnWriteArrayList<ListFind>(pageDao.getListFinds(configurationPageCoding));
        for (ListFind listFind : listFinds) {
            Object temp = findMap.get(listFind.getFieldEn());
            if(temp==null){//前台传入的查询条件为空时
                listFinds.remove(listFind);//删除多余查询条件
                continue;
            }
            listFind.setValue(temp);//添加查询值
        }

        System.out.println(listFinds);
        return pageDao.getListDatas(pageDao.getConfigurationPage(configurationPageCoding).getTableEn(),pageDao.getListFields(configurationPageCoding),listFinds);
    }

    private Map<String, Object> getListParams(String configurationPageCoding) {
        Map<String,Object> listParams = new HashMap<String, Object>();
        listParams.put("url","../listData/"+configurationPageCoding);//请求后台的URL
        listParams.put("method","get");//请求方式
        listParams.put("pageNumber","1");//初始化加载第一页，默认第一页
        listParams.put("pageSize", "20");//每页的记录行数
        listParams.put("height","800");//每页的记录行数
        listParams.put("pageList", Arrays.asList("10", "25","50","100"));//可供选择的每页的行数
        listParams.put("uniqueId","coding");
        listParams.put("columns",getFieldParams(configurationPageCoding));
        return listParams;
    }

    private List<Map<String,Object>> getFieldParams(String configurationPageCoding){
        List<Map<String,Object>> filedParams = new ArrayList<Map<String, Object>>();
        List<ListField> listFields = pageDao.getListFields(configurationPageCoding);
        Map<String, Object> map;
        for(ListField listField : listFields){
            map = new HashMap<String, Object>();
            map.put("field",listField.getFieldEn());//列表字段标识符
            map.put("title",listField.getName());//列表字段名称
            filedParams.add(map);
        }
        map = new HashMap<String, Object>();
        map.put("field","operate");
        map.put("title","操作");
        map.put("events","operateEvents");
        map.put("formatter","operateFormatter");
        filedParams.add(map);
        return filedParams;
    }
    private Boolean doAdd(String configurationPageCoding, Map<String,Object> dataMap){
        if(dataMap==null) dataMap = new HashMap<String, Object>();
        System.out.println(dataMap);
        CopyOnWriteArrayList<EditField> editFields = new CopyOnWriteArrayList<EditField>(pageDao.getEditFields(configurationPageCoding));
        System.out.println(editFields);
        for (EditField editField : editFields) {
            Object temp = dataMap.get(editField.getFieldEn());
            if(temp==null){//前台传入的查询条件为空时
                editFields.remove(editField);//删除多余查询条件
                continue;
            }
            editField.setValue(temp);//添加查询值
        }
        System.out.println(editFields);
        if(pageDao.doAdd(pageDao.getConfigurationPage(configurationPageCoding).getTableEn(),editFields)){
            return true;
        }else{
            return false;
        }
    }
    private Boolean doUpdate(String configurationPageCoding, Map<String,Object> dataMap){
        if(dataMap==null) dataMap = new HashMap<String, Object>();
        Map<String,Object> findMap = new HashMap<String, Object>();
        CopyOnWriteArrayList<EditField> editFields = new CopyOnWriteArrayList<EditField>(pageDao.getEditFields(configurationPageCoding));
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
        if(pageDao.doUpdate(pageDao.getConfigurationPage(configurationPageCoding).getTableEn(),editFields,findMap)){
            return true;
        }else{
            return false;
        }
    }
    private Boolean doRemove (String configurationPageCoding,String id){
        Map<String,Object> findMap = new HashMap<String, Object>();
        findMap.put("coding",id);
        if(pageDao.doDelete(pageDao.getConfigurationPage(configurationPageCoding).getTableEn(),findMap)){
            return true;
        }else{
            return false;
        }
    }
}
