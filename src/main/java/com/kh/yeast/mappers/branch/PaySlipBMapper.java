package com.kh.yeast.mappers.branch;


import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

@Mapper
public interface PaySlipBMapper {

    Map<String, Object> getEmployeePaySlip(@Param("userNo") Long userNo);

    Member findEmployeeByUserName(@Param("userName") String userName);

}
