package com.kh.yeast.mappers.company;


import com.kh.yeast.domain.vo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface DashBoardCMapper {
    // 카테고리별 재고 데이터 조회
    ArrayList<Inventory> selectInventoryByCategory();

    // 총 재고 금액 조회
    int selectTotalInventoryAmount();

    // 전체 직원 목록 조회
    ArrayList<Member> selectAllMembers();

    // 금일 판매내역 조회
    ArrayList<Sell> selectTodaySales();

    // 모든 빵 목록 조회
    ArrayList<Bread> selectAllBread();

    ArrayList<Business> selectAllBusinesses();

    ArrayList<Sell> selectTodaySalesByBusiness(Long businessNo);
}