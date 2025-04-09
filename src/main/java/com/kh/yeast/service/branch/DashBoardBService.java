package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface DashBoardBService {
    // 지점 직원 목록 조회 (B_ 접두사가 붙은 직원만)
    ArrayList<Member> getBranchMembers();
    
    // 특정 지점 소속 직원 목록 조회 (B_ 접두사가 붙은 직원만)
    ArrayList<Member> getBranchMembersByBusinessNo(Long businessNo);
    
    // 사용자 이름으로 회원 정보 조회
    Member getMemberByName(String userName);
}
