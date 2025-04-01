package com.kh.yeast.service;

import com.kh.yeast.domain.entity.Employee;

import java.util.List;

public interface EmployeeMService {

    Employee getMemberInfo(String userId) throws Exception;

    List<Employee> getFilteredEmployees(String business, String position, String enrollDate, int offset, int size) throws Exception;
}
