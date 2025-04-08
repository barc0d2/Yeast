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
        
        // 전체 직원 목록 데이터 추가
        ArrayList<Member> memberList = dashBoardCService.getAllMembers();
        if (memberList == null || memberList.isEmpty()) {
            System.out.println("경고: 직원 데이터가 존재하지 않습니다.");
        } else {
            System.out.println("직원 데이터 로드 성공: " + memberList.size() + "명");
        }
        
        // 전체 지점 목록 조회
        ArrayList<Business> businessList = dashBoardCService.getAllBusinesses();
        
        // 금일 판매내역 데이터 추가
        ArrayList<Sell> todaySales = dashBoardCService.getTodaySales();
        if (todaySales == null || todaySales.isEmpty()) {
            System.out.println("경고: 금일 판매 데이터가 존재하지 않습니다.");
        } else {
            System.out.println("금일 판매 데이터 로드 성공: " + todaySales.size() + "건");
        }
        
        // 빵 정보 조회
        ArrayList<Bread> breadList = dashBoardCService.getAllBread();
        
        // 빵 이름을 키로, 가격을 값으로 하는 맵 생성
        Map<String, Integer> breadPriceMap = new HashMap<>();
        if (breadList != null && !breadList.isEmpty()) {
            for (Bread bread : breadList) {
                breadPriceMap.put(bread.getBreadName(), bread.getPrice());
            }
            System.out.println("빵 데이터 로드 성공: " + breadList.size() + "개 상품");
        } else {
            System.out.println("경고: 빵 데이터가 존재하지 않습니다.");
        }
        
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

    @GetMapping("/sales")
    public String getSalesByBusiness(@RequestParam("businessNo") Long businessNo, Model model) {
        ArrayList<Sell> todaySales = dashBoardCService.getTodaySalesByBusiness(businessNo);
        model.addAttribute("todaySales", todaySales);
        return "company/dashboard/dashboard :: #salesContent";
    }
}
