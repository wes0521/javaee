package com.hrm.dept.dao;

import com.hrm.commons.beans.Dept;
import com.hrm.utils.PageModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IDeptDao {

    List<Dept> selectDept(@Param("name") String name, @Param("pageModel") PageModel pageModel);

    /*<dependency>
          <groupId>org.mybatis</groupId>
          <artifactId>mybatis</artifactId>
          <version>3.4.6</version>
      </dependency>
      版本3.5.2没问题，可以不加@Param("name")
       但是3.4.6，必须加@Param("name")
      */
    int selectDeptCount(@Param("name") String name);

    Dept selectDeptById(Integer id);

    int updateDept(Dept dept);

    int deleteDept(@Param("ids") Integer[] ids);

    int insertDept(Dept dept);
}
