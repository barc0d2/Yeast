package com.kh.yeast.service.branch;

import com.kh.yeast.domain.entity.Employee;
import com.kh.yeast.mappers.branch.PaySlipBMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class PaySlipBServiceImpl implements PaySlipBService {

    private final PaySlipBMapper paySlipBMapper;

    public PaySlipBServiceImpl(PaySlipBMapper paySlipBMapper) {
        this.paySlipBMapper = paySlipBMapper;
    }

    @Override
    public Map<String, Object> getEmployeePaySlip(Long userNo) {
        Map<String, Object> result = paySlipBMapper.getEmployeePaySlip(userNo);

        if (result != null) {
            Integer salary = (Integer) result.get("salary");
            Integer deductionTotal = (Integer) result.get("deductionTotal");
            Integer expectedSalary = salary - deductionTotal;
            result.put("expectedSalary", expectedSalary);
        }

        return result;
    }

    public Employee findByUserName(String userName) {
        return paySlipBMapper.findEmployeeByUserName(userName);
    }

}
