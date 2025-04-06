package com.kh.yeast.service.branch;

import com.kh.yeast.domain.entity.Employee;
import com.kh.yeast.mappers.branch.STableBMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class STableBServiceImpl implements STableBService {

        private final STableBMapper stableBMapper;

        public STableBServiceImpl( STableBMapper stableBMapper) {
            this.stableBMapper = stableBMapper;

        }

        @Override
        public Integer getEmployeeCount() {
            return stableBMapper.selectEmployeeCount();
        }

        @Override
        public List<Employee> getEmployeeList(RowBounds rowBounds) {
            return stableBMapper.selectEmployeeList(rowBounds);
        }

    @Override
    public List<Employee> findEmployeesByName(String userName) {
        List<Employee> employees = stableBMapper.findEmployeesByName(userName);
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
        return stableBMapper.findByUserNo(userNo);
    }

    @Override
    public Employee findByUserName(String userName) {
        return stableBMapper.findByUserName(userName);
    }

}
