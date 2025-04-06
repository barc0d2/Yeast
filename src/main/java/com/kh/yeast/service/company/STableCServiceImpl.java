package com.kh.yeast.service.company;

import com.kh.yeast.domain.entity.Employee;
import com.kh.yeast.mappers.company.STableCMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class STableCServiceImpl implements STableCService {

    private final STableCMapper stableCMapper;

    public STableCServiceImpl(STableCMapper stableCMapper) {
        this.stableCMapper = stableCMapper;
    }

    @Override
    public Integer getEmployeeCount() {
        return stableCMapper.selectEmployeeCount();
    }

    @Override
    public List<Employee> getEmployeeList(RowBounds rowBounds) {
        return stableCMapper.selectEmployeeList(rowBounds);
    }

    @Override
    public List<Employee> findEmployeesByName(String userName) {
        List<Employee> employees = stableCMapper.findEmployeesByName(userName);
        for (Employee employee : employees) {
            if (employee.getHeadName() == null) {
                employee.setHeadName("없음");
            }
            if (employee.getStatus() != null) {
                employee.setStatus(employee.getStatus().equals("1") ? "수급 완료" : "미완료");
            }
        }
        return employees;
    }

    @Override
    public Employee findByUserNo(Long userNo) {
        return stableCMapper.findByUserNo(userNo);
    }

    @Override
    public Employee findByUserName(String userName) {
        return stableCMapper.findByUserName(userName);
    }
}
