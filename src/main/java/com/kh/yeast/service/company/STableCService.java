package com.kh.yeast.service.company;

import com.kh.yeast.domain.entity.Employee;
import org.apache.ibatis.session.RowBounds;
import java.util.List;

public interface STableCService {

    Integer getEmployeeCount();

    List<Employee> getEmployeeList(RowBounds rowBounds);

    List<Employee> findEmployeesByName(String userName);

    Employee findByUserNo(Long userNo);

    Employee findByUserName(String userName);
}
