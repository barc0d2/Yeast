package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Sell;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public interface DashBoardBService {
    // 지점 직원 목록 조회 (B_ 접두사가 붙은 직원만)
    ArrayList<Member> getBranchMembers();

    // 특정 지점 소속 직원 목록 조회 (B_ 접두사가 붙은 직원만)
    ArrayList<Member> getBranchMembersByBusinessNo(Long businessNo);
    
    // 사용자 이름으로 회원 정보 조회
    Member getMemberByName(String userName);

    ArrayList<Sell> financeList();
    
    // 특정 지점의 금일 판매내역 조회
    ArrayList<Sell> getTodaySalesByBusiness(Long businessNo);
    
    // 카테고리별 판매 개수 조회
    List<Map<String, Object>> getCategorySalesByBusiness(Long businessNo);
}
