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

    @GetMapping("/storechart")
    public String dailyRevenueForm(HttpSession session, Model model) {
        Member member = (Member)session.getAttribute("member");
//        String businessName =  member.getBusinessName();
        String businessName = "서울 홍대점";
        ArrayList<BreadInventory> breadInventoryList = null;
        try {
            breadInventoryList = financeBService.dailyBreadList(businessName);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("list", breadInventoryList);
        model.addAttribute("currentName", "판매기록조회");
        model.addAttribute("smallCurrentName","판매내역");
        return "branch/finance/storechart";
    }

    @GetMapping("/storeDetail")
    public String selectSellList(HttpSession session, Model model){
        Member member = (Member)session.getAttribute("member");
//        String businessName =  member.getBusinessName();
        String businessName = "서울 강남점";
        ArrayList<Sell> sellList;
        try{
//            sellList = financeBService.selectSellList()
        }catch (Exception e){

        }

        return "branch/finance/detial";
    }
}
