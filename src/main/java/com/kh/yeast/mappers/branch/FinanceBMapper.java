package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.vo.BreadInventory;
import com.kh.yeast.domain.vo.Sell;
import org.apache.ibatis.annotations.Mapper;

import java.sql.Timestamp;
import java.util.ArrayList;

@Mapper
public interface FinanceBMapper {
    ArrayList<BreadInventory> inventoryList(String businessName);
    ArrayList<Sell> selectTodaySell(Long businessNo);
    Integer insertSell(Sell sell);
    Integer updateMoney(Integer money, Long businessNo, Timestamp createDate);
}
