package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.sql.Timestamp;
import java.util.ArrayList;

@Mapper
public interface SpecificationBMapper {

    Integer selectEmployeeCount(Long businessNo);

    ArrayList<Member> selectEmployeeList(RowBounds rowBounds, String search, Long businessNo);

    Member findByUserNo(Long userNo);

    Integer selectCompanyMoney(Long businessNo);

    Integer selectMonthlySellMoney(Long businessNo);

    Integer lastMonthStatus(Long businessNo);

    ArrayList<Business> selectBusinessList(RowBounds rowBounds);

    Integer updateSubMoney(Long businessNo, Integer money);

    Integer updateAddMoney(Long businessNo, Integer money);

    Integer updateSellMonthly(Long businessNo);

    Integer updateRemitted(Long businessNo);
}
