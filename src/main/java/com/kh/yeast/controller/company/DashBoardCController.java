package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.*;
import com.kh.yeast.service.company.DashBoardCService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@Controller
@RequestMapping("/company/dashboard")
public class DashBoardCController {

    private final DashBoardCService dashBoardCService;

    @GetMapping
    public String dashboard(Model model) throws Exception  {

        ArrayList<Inventory> productionData = dashBoardCService.productionList();

        int totalAmount = dashBoardCService.getTotalInventoryAmount();

        ArrayList<Member> memberList = dashBoardCService.getAllMembers();

        ArrayList<Business> businessList = dashBoardCService.getAllBusinesses();
        
        ArrayList<Sell> todaySales = dashBoardCService.getTodaySales();

        Map<String, Integer> breadPriceMap = new HashMap<>();
        
        model.addAttribute("productionData", productionData);
        model.addAttribute("totalAmount", totalAmount > 0 ? totalAmount : 11040000);
        model.addAttribute("memberList", memberList);
        model.addAttribute("todaySales", todaySales);
        model.addAttribute("breadPriceMap", breadPriceMap);
        model.addAttribute("businessList", businessList);
        model.addAttribute("currentName", "대시보드");
        model.addAttribute("smallCurrentName","대시보드");
        return "company/dashboard/dashboard";
    }

    @GetMapping("/produtionchart")
    public String selectDashChart(Model model) throws Exception  {
        ArrayList<Inventory> list = dashBoardCService.productionList();
        model.addAttribute("list", list);
        model.addAttribute("currentName", "생산관리");

        if(list.size() > 0){
            return "/company/dashboard/produtionchart";
        } else{
            model.addAttribute("errorMsg", "생산 데이터 불러오기 실패");
            return "common/errorPage";
        }
    }

    @GetMapping("/sales")
    public String getSalesByBusiness(@RequestParam("businessNo") Long businessNo, Model model) {
        ArrayList<Sell> todaySales = dashBoardCService.getTodaySalesByBusiness(businessNo);
        model.addAttribute("todaySales", todaySales);

        ArrayList<Bread> breadList = dashBoardCService.getAllBread();

        Map<String, Integer> breadPriceMap = new HashMap<>();
        if (breadList != null && !breadList.isEmpty()) {
            for (Bread bread : breadList) {
                breadPriceMap.put(bread.getBreadName(), bread.getPrice());
            }
        }
        
        model.addAttribute("breadPriceMap", breadPriceMap);
        return "company/dashboard/salesContent";
    }
}
