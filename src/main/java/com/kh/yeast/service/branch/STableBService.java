package com.kh.yeast.service.branch;

import com.kh.yeast.domain.entity.Employee;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface STableBService {
    Integer getEmployeeCount();

    List<Employee> getEmployeeList(RowBounds rowBounds);

    List<Employee> findEmployeesByName(String userName);
}
