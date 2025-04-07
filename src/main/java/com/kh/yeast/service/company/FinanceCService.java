package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Sell;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;

import java.util.ArrayList;

public interface FinanceCService {
    ArrayList<Sell> selectRecentlySellList();

    Model selectSellList(Long businessNo, Integer cpage, String period, Model model);

    Model allSellList(Integer cpage, String period, Model model);
}
