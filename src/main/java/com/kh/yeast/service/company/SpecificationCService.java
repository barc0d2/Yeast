package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;

import java.util.ArrayList;
import java.util.List;

public interface SpecificationCService {

    Integer selectEmployeeCount();

    ArrayList<Member> getEmployeeList(PageInfo pi);

    List<Member> findEmployeesByName(String userName);

    Member findByUserNo(Long userNo);

    Member findByUserName(String userName);
}
