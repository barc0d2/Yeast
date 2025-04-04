package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.Sell;

import java.util.ArrayList;

public interface FinanceCService {
    ArrayList<Sell> selectSellList();
}
