package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Inventory;
import com.kh.yeast.domain.vo.Member;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface DashBoardCService {

    // 카테고리별 재고 데이터 조회
    ArrayList<Inventory> productionList();
    
    // 총 재고 금액 조회
    int getTotalInventoryAmount();
    
    // 전체 직원 목록 조회
    ArrayList<Member> getAllMembers();
}
