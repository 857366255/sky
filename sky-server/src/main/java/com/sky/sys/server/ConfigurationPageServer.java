package com.sky.sys.server;

import com.sky.sys.po.ConfigurationPage;

import java.util.Map;

/**
 * Created by Administrator on 2017/12/30.
 */
public interface ConfigurationPageServer {

    public Map<String,Object> getListParams(String configurationPageCoding);

    public Boolean addConfigurationPageInformation(ConfigurationPage configurationPage);
}
