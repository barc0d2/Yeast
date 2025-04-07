package com.kh.yeast.mappers.company;

import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

@Mapper
public interface MonthlyFeeCMapper {

    Map<String, Object> getEmployeePaySlip(@Param("userNo") Long userNo);

    Member findEmployeeByUserName(@Param("userName") String userName);

    Long getCompanyMoneyByUserNo(@Param("userNo") Long userNo);

    Long updateCompanyMoney(@Param("userNo") Long userNo, @Param("salary") int salary);

    Long selectCSalaryByUserNo(@Param("userNo") Long userNo);

    Long selectMonthlySellMoneyByBusinessNo(@Param("businessNo") Long businessNo);

}
