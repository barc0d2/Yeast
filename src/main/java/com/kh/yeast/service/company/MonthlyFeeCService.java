package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Member;

import java.util.Map;

public interface MonthlyFeeCService {

    Map<String, Object> getEmployeePaySlip(Long userNo);

    Member findByUserName(String userName);

    Long getCompanyMoneyByUserNo(Long userNo);

    boolean deductSalaryFromCompany(Long userNo, int salary);

    Long getCSalaryByUserNo(Long userNo);

    Long getMonthlySellMoneyByBusinessNo(Long businessNo);

}
