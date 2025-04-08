package com.kh.yeast.service.branch;

public interface PaySlipToggleBService {

    Long getSalaryByUserNo(Long userNo);

    Long getBranchMoneyByUserNo(Long userNo);

    boolean deductSalaryFromBranch(Long userNo, int salary);
}
