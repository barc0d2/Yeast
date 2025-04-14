package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Sell;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Mapper
public interface DashBoardBMapper {
    ArrayList<Member> selectBranchMembers();
    
    ArrayList<Member> selectBranchMembersByBusinessNo(@Param("businessNo") Long businessNo);
    
    Member selectMemberByName(@Param("userName") String userName);

    ArrayList<Sell> selectFinanceChart();

    ArrayList<Bread> selectAllBread();

    ArrayList<Sell> selectTodaySalesByBusiness(@Param("businessNo") Long businessNo);
    
    List<Map<String, Object>> selectCategorySalesByBusiness(@Param("businessNo") Long businessNo);
}
