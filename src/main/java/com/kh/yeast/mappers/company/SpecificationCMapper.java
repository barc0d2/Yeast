package com.kh.yeast.mappers.company;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface SpecificationCMapper {

    Integer selectEmployeeCount();

    ArrayList<Member> selectEmployeeList(RowBounds rowBounds, String search);

//    List<Member> getAllEmployees();

    List<Member> findEmployeesByName(@Param("userName") String userName);

    Member findByUserNo(Long userNo);

    Member findByBusinessNo(Long businessNo);

    Integer lastMonthStatus(Long businessNo);

    Integer selectMonthlySellMoney(Long businessNo);

    ArrayList<Business> selectBusinessList(RowBounds rowBounds);
}
