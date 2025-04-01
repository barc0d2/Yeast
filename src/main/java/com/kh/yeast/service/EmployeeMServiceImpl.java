package com.kh.yeast.service;

import com.kh.yeast.domain.entity.Employee;
import com.kh.yeast.mappers.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeMServiceImpl implements EmployeeMService {

    private final EmployeeMapper employeeMapper;

    @Autowired
    public EmployeeMServiceImpl(EmployeeMapper employeeMapper) {
        this.employeeMapper = employeeMapper;
    }

    @Override
    public Employee getMemberInfo(String userId) {
        return employeeMapper.findByUserId(userId);
    }

    @Override
    public List<Employee> getFilteredEmployees(String business, String position, String enrollDate, int offset, int size) {
        return employeeMapper.findEmployees(business, position, enrollDate, offset, size);
    }
}
