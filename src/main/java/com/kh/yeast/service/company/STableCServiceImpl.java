package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Member;
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
    public List<Member> getEmployeeList(RowBounds rowBounds) {
        return stableCMapper.selectEmployeeList(rowBounds);
    }

    @Override
    public List<Member> findEmployeesByName(String userName) {
        List<Member> employees = stableCMapper.findEmployeesByName(userName);
        for (Member employee : employees) {
            if (employee.getHeadName() == null) {
                employee.setHeadName("없음");
            }
            if (employee.getStatus() != null) {
            }
        }
        return employees;
    }

    @Override
    public Member findByUserNo(Long userNo) {
        return stableCMapper.findByUserNo(userNo);
    }

    @Override
    public Member findByUserName(String userName) {
        return stableCMapper.findByUserName(userName);
    }
}
