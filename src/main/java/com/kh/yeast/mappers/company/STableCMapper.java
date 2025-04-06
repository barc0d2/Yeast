package com.kh.yeast.mappers.company;

import com.kh.yeast.domain.entity.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import java.util.List;

@Mapper
public interface STableCMapper {

    Integer selectEmployeeCount();

    List<Employee> selectEmployeeList(RowBounds rowBounds);

    List<Employee> getAllEmployees();

    List<Employee> findEmployeesByName(@Param("userName") String userName);

    Employee findByUserNo(Long userNo);

    Employee findByUserName(String userName);
}
