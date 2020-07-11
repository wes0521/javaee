package com.hrm.job.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

public class JobProvider {

    //查询职位
    public String selectJob(final Map map){

        //匿名内部类
        String sql = new SQL(){
            {
                this.SELECT("*");
                this.FROM("job_inf");
                if (map.get("name") != null && !map.get("name").equals("")){
                    this.WHERE("name like '%' #{name} '%'");
                }
                //PageModel pageModel = (PageModel) map.get("pageModel");
                this.LIMIT("#{pageModel.firstLimitParam},#{pageModel.pageSize}");
            }
        }.toString();
        return sql;
    }

    //查询职位数量
    public String selectJobCount(final String name){
        String sql = new SQL(){
            {
                this.SELECT("count(*)");
                this.FROM("job_inf");
                if (name != null && !name.equals("")){
                    this.WHERE("name like '%' #{name} '%'");
                }
            }
        }.toString();
        return sql;
    }

    //删除职位
    public String deleteJob(@Param("ids") Integer[] ids){
       StringBuffer sql = new StringBuffer();
       sql.append("delete from job_inf where id in (");
       for (int id:ids){
           sql.append(id + ",");
       }
       sql.deleteCharAt(sql.length()-1);
       sql.append(")");
        return sql.toString();
    }
}
