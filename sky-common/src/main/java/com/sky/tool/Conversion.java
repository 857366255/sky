package com.sky.tool;

/**
 * Created by wz on 2018/3/24.
 */
public class Conversion {
    /**
     * 转换成String类型
     * @param obj
     * @return
     */
    public static String valueOfString(Object obj){
        if(obj==null) return null;
        return String.valueOf(obj);
    }

    /**
     * 转换成Integer类型
     * @param obj
     * @return
     */
    public static Integer valueOfInteger(Object obj){
        if(obj==null) return null;
        if(obj instanceof Integer || obj instanceof String) return Integer.valueOf(obj.toString());

        try {
            throw new Exception("sky:"+obj.getClass().getName()+"该类型未编写转换成Integer");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 转换成Boolean类型
     * @param obj
     * @return
     */
    public static Boolean valueOfBoolean(Object obj){
        if(obj==null) return null;
        if(obj instanceof Boolean) return (Boolean)obj;
        if(obj instanceof Integer || obj instanceof String ) return Boolean.valueOf(obj.toString());
        try {
            throw new Exception("sky:"+obj.getClass().getName()+"该类型未编写转换成Boolean");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
