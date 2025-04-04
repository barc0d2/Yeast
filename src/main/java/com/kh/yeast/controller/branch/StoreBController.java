package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.BreadInventory;
import com.kh.yeast.service.branch.StoreBService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;

@Controller
public class StoreBController {

    private final StoreBService storeBService;

    public StoreBController(StoreBService storeBService) {
        this.storeBService = storeBService;
    }

    @GetMapping("/branch/finance/storechart")
    public String dailyRevenueForm(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Member member = (Member)session.getAttribute("member");
//        String businessName =  member.getBusinessName();
        String businessName = "서울 강남점";
        ArrayList<BreadInventory> breadInventoryList = storeBService.dailyBreadList(businessName);
        System.out.println("breadInventoryList"+breadInventoryList.size());
        model.addAttribute("list", breadInventoryList);
        model.addAttribute("currentName", "판매기록조회");
        model.addAttribute("smallCurrentName","판매내역");
        return "branch/finance/storechart";
    }
}