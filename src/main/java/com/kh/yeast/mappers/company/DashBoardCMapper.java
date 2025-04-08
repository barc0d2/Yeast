package com.kh.yeast.mappers.company;


import com.kh.yeast.domain.vo.Inventory;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface DashBoardCMapper {
    // 카테고리별 재고 데이터 조회
    ArrayList<Inventory> selectInventoryByCategory();
    
    // 총 재고 금액 조회
    int selectTotalInventoryAmount();
}
