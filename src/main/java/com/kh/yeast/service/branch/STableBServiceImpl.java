package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.mappers.branch.STableBMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Date;
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
        public List<Member> getEmployeeList(RowBounds rowBounds) {
            return stableBMapper.selectEmployeeList(rowBounds);
        }

    @Override
    public List<Member> findEmployeesByName(String userName) {
        List<Member> employees = stableBMapper.findEmployeesByName(userName);
        LocalDate now = LocalDate.now();

        for (Member employee : employees) {
            if (employee.getHeadName() == null) {
                employee.setHeadName("없음");
            }


            if (employee.getUpdateAt() != null) {
                LocalDate updateAt = employee.getUpdateAt();
                boolean sameYearAndMonth = updateAt.getYear() == now.getYear() &&
                        updateAt.getMonth() == now.getMonth();
                employee.setStatus(sameYearAndMonth ? 1 : 0);
            } else {
                employee.setStatus(0);
            }
            System.out.println("사용자: " + employee.getUserName() + " / updateAt: " + employee.getUpdateAt());
        }


        return employees;
    }

    @Override
    public Member findByUserNo(Long userNo) {
        return stableBMapper.findByUserNo(userNo);
    }

    @Override
    public Member findByUserName(String userName) {
        return stableBMapper.findByUserName(userName);
    }

}
