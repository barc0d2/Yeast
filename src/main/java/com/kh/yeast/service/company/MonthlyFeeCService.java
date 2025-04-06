package com.kh.yeast.service.company;

import com.kh.yeast.domain.entity.Employee;
import java.util.Map;

public interface MonthlyFeeCService {

    Map<String, Object> getEmployeePaySlip(Long userNo);

    Employee findByUserName(String userName);
}
