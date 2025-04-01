package com.kh.yeast.mappers;

import com.kh.yeast.domain.entity.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface EmployeeMapper {

    List<Employee> findEmployees(@Param("business") String business,
                                 @Param("position") String position,
                                 @Param("enrollDate") String enrollDate,
                                 @Param("offset") int offset,
                                 @Param("size") int size);

    int countEmployees(@Param("business") String business,
                       @Param("position") String position,
                       @Param("enrollDate") String enrollDate);

    Employee findByUserId(@Param("userId") String userId);
}
