package com.kh.yeast.service.branch;

import com.kh.yeast.mappers.branch.PaySlipToggleBMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaySlipToggleBServiceImpl implements PaySlipToggleBService {


    private final PaySlipToggleBMapper paySlipBToggleMapper;

    public PaySlipToggleBServiceImpl(PaySlipToggleBMapper paySlipBToggleMapper) {
        this.paySlipBToggleMapper = paySlipBToggleMapper;
    }

    @Override
    public Long getSalaryByUserNo(Long userNo) {
        return paySlipBToggleMapper.selectSalaryByUserNo(userNo);
    }

    @Override
    public Long getBranchMoneyByUserNo(Long userNo) {
        return paySlipBToggleMapper.getBranchMoneyByUserNo(userNo);
    }

    @Override
    public boolean deductSalaryFromBranch(Long userNo, int salary) {
        int result = paySlipBToggleMapper.updateBranchMoney(userNo, salary);
        return result > 0;
    }

}
