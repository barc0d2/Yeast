package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.service.branch.DashBoardBService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.MyBatisSystemException;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Controller
@RequestMapping("/branch/dashboard")
public class DashBoardBController {

    private final DashBoardBService dashBoardBService;

    @GetMapping
    public String dashboard(HttpSession session, Model model) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        Member updatedUser = dashBoardBService.getMemberByName(loginUser.getUserName());

        loginUser.setBusinessNo(updatedUser.getBusinessNo());
        loginUser.setBusinessName(updatedUser.getBusinessName());
        session.setAttribute("loginUser", loginUser);

        ArrayList<Member> memberList = dashBoardBService.getBranchMembersByBusinessNo(loginUser.getBusinessNo());
        ArrayList<Sell> todaySales = dashBoardBService.getTodaySalesByBusiness(loginUser.getBusinessNo());
        List<Map<String, Object>> categorySales = dashBoardBService.getCategorySalesByBusiness(loginUser.getBusinessNo());

        ArrayList<Bread> breadList = dashBoardBService.getAllBread();


        Map<String, Integer> breadPriceMap = new HashMap<>();
        if (breadList != null && !breadList.isEmpty()) {
            for (Bread bread : breadList) {
                breadPriceMap.put(bread.getBreadName(), bread.getPrice());
            }
        }

        model.addAttribute("memberList", memberList);
        model.addAttribute("todaySales", todaySales);
        model.addAttribute("categorySales", categorySales);
        model.addAttribute("breadPriceMap", breadPriceMap);
        model.addAttribute("currentName", "대시보드");
        model.addAttribute("smallCurrentName", "대시보드");
        return "branch/dashboard/dashboard";
    }

    @GetMapping("/mypage")
    public String redirectToBMyPage(@SessionAttribute("loginUser") Member loginUser) {
        String userId = loginUser.getUserId();
        return "redirect:/branch/mypage/myPage?userId=" + userId;
    }

}
