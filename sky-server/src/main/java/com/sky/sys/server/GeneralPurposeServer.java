package com.sky.sys.server;


import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/30.
 */
public interface GeneralPurposeServer{
    /**
     * 获得树形结构数据
     * @param configurationPageCoding 配置页面编码
     * @return
     */
    public List<Map<String,Object>> getTree2(String configurationPageCoding);

}
