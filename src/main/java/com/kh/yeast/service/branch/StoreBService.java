package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.BreadInventory;
import com.kh.yeast.domain.vo.Sell;

import java.util.ArrayList;

public interface StoreBService {
    ArrayList<BreadInventory> dailyBreadList(String businessName);
    Integer insertSell(Sell sell);
}
