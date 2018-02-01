package com.sky.sys.server;

import com.sky.admin.po.ConfigurationPage;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/30.
 */
public interface ConfigurationPageServer {
    /**
     * 获得列表字段信息
     *
     * @param configurationPageCoding
     * @return
     */
    public Map<String,Object> getListParams(String configurationPageCoding);

    /**
     * 获得创建字段信息
     *
     * @param configurationPageCoding
     * @return
     */
    public Map<String, Object> getEditParams(String configurationPageCoding);

    public Boolean addConfigurationPageInformation(ConfigurationPage configurationPage);

    public List<Map<String,Object>> getListData(String tableNameEn, Map<String, Object> findMap);
}
