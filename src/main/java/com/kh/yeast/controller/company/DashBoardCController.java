package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Inventory;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.service.company.DashBoardCService;
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
@RequestMapping("/company/dashboard")
public class DashBoardCController {

    private final DashBoardCService dashBoardCService;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        // 생산 현황 데이터 추가
        ArrayList<Inventory> productionData = dashBoardCService.productionList();
        int totalAmount = dashBoardCService.getTotalInventoryAmount();
        
        // 데이터가 비어있는지 확인하고 로그 출력
        if (productionData == null || productionData.isEmpty()) {
            System.out.println("경고: 생산 데이터가 존재하지 않습니다.");
        } else {
            System.out.println("생산 데이터 로드 성공: " + productionData.size() + "개 카테고리");
        }
        
        model.addAttribute("productionData", productionData);
        model.addAttribute("totalAmount", totalAmount > 0 ? totalAmount : 11040000);
        model.addAttribute("currentName", "대시보드");
        model.addAttribute("smallCurrentName","대시보드");
        return "company/dashboard/dashboard";
    }

    @GetMapping("/produtionchart")
    public String selectDashChart(Model model) {
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
}
