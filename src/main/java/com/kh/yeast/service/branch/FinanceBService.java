package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.BreadInventory;
import com.kh.yeast.domain.vo.Sell;

import java.util.ArrayList;

public interface FinanceBService {
    ArrayList<BreadInventory> dailyBreadList(String businessName) throws Exception;
    String insertSell(Sell sell) throws Exception;
}
