package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.BreadInventory;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.service.branch.FinanceBService;
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
@RequestMapping("/branch/finance")
public class FinanceBController {

    private final FinanceBService financeBService;

    @GetMapping("/list")
    public String dailyRevenueForm(HttpSession session, Model model) throws Exception {
        Member member = (Member)session.getAttribute("loginUser");
        Long businessNo =  member.getBusinessNo();
        ArrayList<BreadInventory> breadInventoryList = financeBService.dailyBreadList(businessNo);
        model.addAttribute("list", breadInventoryList);
        model.addAttribute("currentName", "판매기록조회");
        model.addAttribute("smallCurrentName","판매내역");
        return "branch/finance/storechart";
    }
}
