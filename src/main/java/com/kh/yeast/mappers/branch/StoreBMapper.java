package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.BreadInventory;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface StoreBMapper {
    ArrayList<Bread> breadList();
    ArrayList<BreadInventory> inventoryList(String businessName);
}
