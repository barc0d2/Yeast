package com.kh.yeast.service.branch;

import com.kh.yeast.domain.entity.Employee;

import java.util.Map;

public interface PaySlipBService {

    Map<String, Object> getEmployeePaySlip(Long userNo);

    Employee findByUserName(String userName);

}
