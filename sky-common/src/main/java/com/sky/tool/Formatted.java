package com.sky.tool;



import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;

import java.util.Date;

/**
 * Created by Administrator on 2017/12/28.
 */
public class Formatted {
    public static String  getCoding(String prefix, String time, String sequenceName, String suffix){
        StringBuffer stringBuffer = new StringBuffer();
        if(StringUtils.isNotEmpty(prefix))stringBuffer.append(prefix);
        if(StringUtils.isNotEmpty(prefix))stringBuffer.append(time);
        if(StringUtils.isNotEmpty(prefix))stringBuffer.append(sequenceName);
        if(StringUtils.isNotEmpty(prefix))stringBuffer.append(suffix);
        return stringBuffer.toString();
    }
}
