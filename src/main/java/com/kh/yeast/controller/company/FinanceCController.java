package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.BreadInventory;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.service.company.FinanceCService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
@RequestMapping("/company/finance")
public class FinanceCController {

    private final FinanceCService financeCService;

    @GetMapping("/storeGraph")
    public String selectStoreList(Model model) {
        ArrayList<Sell> list = financeCService.selectSellList();
        model.addAttribute("list", list);
        model.addAttribute("currentName", "재무관리");
        model.addAttribute("smallCurrentName","도매 매출");
        return "company/finance/storegraph";
    }
}
