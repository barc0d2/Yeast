package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.BreadInventory;
import com.kh.yeast.domain.vo.Sell;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface StoreBMapper {
    ArrayList<BreadInventory> inventoryList(String businessName);
    Integer insertSell(Sell sell);
}
