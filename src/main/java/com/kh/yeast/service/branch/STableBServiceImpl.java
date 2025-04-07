package com.kh.yeast.service.branch;

import com.kh.yeast.domain.entity.Employee;
import com.kh.yeast.mappers.branch.STableBMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
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
        LocalDate now = LocalDate.now();

        for (Employee employee : employees) {
            if (employee.getHeadName() == null) {
                employee.setHeadName("없음");
            }


            if (employee.getUpdateAt() != null) {
                LocalDate updateAt = employee.getUpdateAt();
                boolean sameYearAndMonth = updateAt.getYear() == now.getYear() &&
                        updateAt.getMonth() == now.getMonth();
                employee.setStatus(sameYearAndMonth ? "수급 완료" : "수급");
            } else {
                employee.setStatus("수급");
            }
            System.out.println("사용자: " + employee.getUserName() + " / updateAt: " + employee.getUpdateAt());
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
