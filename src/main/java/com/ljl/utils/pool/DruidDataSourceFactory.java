package com.ljl.utils.pool;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.datasource.unpooled.UnpooledDataSourceFactory;

import javax.sql.DataSource;
import java.sql.SQLException;

public class DruidDataSourceFactory extends UnpooledDataSourceFactory {
    public DruidDataSourceFactory(){
        this.dataSource = new DruidDataSource();
    }
    //根据选用连接池不同，查看是否需要重写getDataSource方法
    @Override
    public DataSource getDataSource() {
        try {
            ((DruidDataSource)this.dataSource).init();//初始化Druid数据源
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return this.dataSource;
    }
}
