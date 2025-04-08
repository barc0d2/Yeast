package com.kh.yeast.mappers.branch;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PaySlipToggleBMapper {

    Long selectSalaryByUserNo(Long userNo);

    int selectMoneyByUserNo(Long userNo);

    Long getBranchMoneyByUserNo(@Param("userNo") Long userNo);

    int updateBranchMoney(@Param("userNo") Long userNo, @Param("salary") int salary);
}
