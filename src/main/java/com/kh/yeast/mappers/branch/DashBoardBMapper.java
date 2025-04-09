package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface DashBoardBMapper {
    // 지점 직원 목록 조회 (B_ 접두사가 붙은 직원만)
    ArrayList<Member> selectBranchMembers();
    
    // 특정 지점 소속 직원 목록 조회 (B_ 접두사가 붙은 직원만)
    ArrayList<Member> selectBranchMembersByBusinessNo(@Param("businessNo") Long businessNo);
    
    // 사용자 이름으로 회원 정보 조회
    Member selectMemberByName(@Param("userName") String userName);
}
