package com.kh.yeast.mappers.company;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Mapper
public interface SpecificationCMapper {

    Integer selectEmployeeCount(Long businessNo);

    ArrayList<Member> selectEmployeeList(RowBounds rowBounds, String search, Long businessNo);

    Member findByUserNo(Long userNo);

    Integer selectCompanyMoney();

    Member findByBusinessNo(Long businessNo);

    Integer lastMonthStatus(Long businessNo);

    Integer selectMonthlySellMoney(Long businessNo);

    ArrayList<Business> selectBusinessList(RowBounds rowBounds);

    Timestamp selectMemberUpdate(Long userNo);

    Timestamp selectCompanyUpdate();

    Integer updateEmployeeSalary(Long userNo, Timestamp updateAt);

    Integer updateCompanyMoney(Integer deduction, Timestamp updateAt);
}
