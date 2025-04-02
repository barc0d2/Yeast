package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.entity.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import java.util.List;

@Mapper
public interface STableBMapper {

    Integer selectEmployeeCount();

    List<Employee> selectEmployeeList(RowBounds rowBounds);

    List<Employee> findEmployeesByName(String userName);

}
