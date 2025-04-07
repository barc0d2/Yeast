package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;

import java.util.Map;

public interface PaySlipBService {

    Map<String, Object> getEmployeePaySlip(Long userNo);

    Member findByUserName(String userName);

}
