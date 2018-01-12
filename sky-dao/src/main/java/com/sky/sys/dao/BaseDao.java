package com.sky.sys.dao;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by wz on 2017/8/12.
 */
public interface BaseDao<K,V> {

    /**
     * 实现数据增加操作
     * @param vo 表示要执行操作的对象
     * @return 成功返回true,失败返回false
     * @throws SQLException
     */
    public boolean doCreate(V vo);

    /**
     * 实现数据操作
     * @param vo 表示要执行更新对象
     * @return 成功返回true,失败返回false
     * @throws SQLException
     */
    public boolean doUpdate(V vo);

    /**
     * 实现数据批量删除
     * @param ids 表示要执行删除的数据集合
     * @return 成功返回true,失败返回false
     * @throws SQLException
     */
    public boolean doRemoveBatch(List<?> ids);
    /**
     * 实现数据单个删除
     * @param id 表示要执行删除的数据的行
     * @return 成功返回true,失败返回false
     * @throws SQLException
     */
    public boolean doRemove(K id);

    /**
     * 根据用户提供的id进行查询
     * @param id 表使用执行查询的行
     * @return 查询成功返回该数据行中的记录，失败返回null
     * @throws SQLException
     */
    public V findById(K id);

    /**
     * 实现数据全部查询
     * @return 成功返回全部数据，失败返回null
     * @throws SQLException
     */
    public List<V> findAll();

    public List<V> findByCondition(V vo);

}
