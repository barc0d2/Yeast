package com.kh.yeast.service.company;

import com.kh.yeast.domain.entity.Employee;
import com.kh.yeast.mappers.company.MonthlyFeeCMapper;
import org.springframework.stereotype.Service;
import java.util.Map;

@Service
public class MonthlyFeeCServiceImpl implements MonthlyFeeCService {

    private final MonthlyFeeCMapper monthlyFeeCMapper;

    public MonthlyFeeCServiceImpl(MonthlyFeeCMapper monthlyFeeCMapper) {
        this.monthlyFeeCMapper = monthlyFeeCMapper;
    }

    @Override
    public Map<String, Object> getEmployeePaySlip(Long userNo) {
        Map<String, Object> result = monthlyFeeCMapper.getEmployeePaySlip(userNo);

        if (result != null) {
            Integer salary = (Integer) result.get("salary");
            Integer deductionTotal = (Integer) result.get("deductionTotal");
            Integer expectedSalary = salary - deductionTotal;
            result.put("expectedSalary", expectedSalary);
        }

        return result;
    }

    @Override
    public Employee findByUserName(String userName) {
        return monthlyFeeCMapper.findEmployeeByUserName(userName);
    }
}
