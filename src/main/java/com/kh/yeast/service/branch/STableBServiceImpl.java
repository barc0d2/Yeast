package com.kh.yeast.service.branch;

import com.kh.yeast.domain.entity.Employee;
import com.kh.yeast.mappers.branch.STableBMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class STableBServiceImpl implements STableBService {

        private final STableBMapper employeeCMapper;

        public STableBServiceImpl(STableBMapper employeeCMapper) {
            this.employeeCMapper = employeeCMapper;
        }

        @Override
        public Integer getEmployeeCount() {
            return employeeCMapper.selectEmployeeCount();
        }

        @Override
        public List<Employee> getEmployeeList(RowBounds rowBounds) {
            return employeeCMapper.selectEmployeeList(rowBounds);
        }

        @Override
        public List<Employee> findEmployeesByName(String userName) {
            return employeeCMapper.findEmployeesByName(userName);
        }
}
