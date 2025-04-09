package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.service.branch.DashBoardBService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.MyBatisSystemException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
@RequestMapping("/branch")
public class DashBoardBController {

    private final DashBoardBService dashBoardBService;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        // 세션에서 로그인한 사용자 정보 가져오기
        Member loginUser = (Member) session.getAttribute("loginUser");
        
        // 지점 직원 목록 조회 (로그인한 사용자의 지점에 소속된 직원만)
        ArrayList<Member> memberList;
        
        if (loginUser != null) {
            // 로그인 사용자의 지점번호가 없는 경우 사용자 이름으로 DB에서 조회
            if (loginUser.getBusinessNo() == null && loginUser.getUserName() != null) {
                try {
                    Member updatedUser = dashBoardBService.getMemberByName(loginUser.getUserName());
                    if (updatedUser != null && updatedUser.getBusinessNo() != null) {
                        // 조회된 정보로 세션 업데이트
                        loginUser.setBusinessNo(updatedUser.getBusinessNo());
                        loginUser.setBusinessName(updatedUser.getBusinessName());
                        session.setAttribute("loginUser", loginUser);
                        System.out.println("사용자 정보 업데이트: " + loginUser.getUserName() 
                                          + ", 지점번호: " + loginUser.getBusinessNo()
                                          + ", 지점명: " + loginUser.getBusinessName());
                    }
                } catch (MyBatisSystemException e) {
                    System.out.println("동명이인 발생: " + loginUser.getUserName() + ", 기본 직원 목록을 표시합니다.");
                } catch (Exception e) {
                    System.out.println("회원 정보 조회 중 오류: " + e.getMessage());
                }
            }
            
            if (loginUser.getBusinessNo() != null) {
                // 로그인한 사용자의 지점 번호로 해당 지점 직원만 조회
                memberList = dashBoardBService.getBranchMembersByBusinessNo(loginUser.getBusinessNo());
                model.addAttribute("businessName", loginUser.getBusinessName() != null ? 
                                  loginUser.getBusinessName() : "소속 지점");
                System.out.println("해당 지점 직원만 조회: " + loginUser.getBusinessName());
            } else {
                memberList = dashBoardBService.getBranchMembers();
                model.addAttribute("businessName", "전체 지점");
                System.out.println("지점 번호를 확인할 수 없어 전체 직원 조회");
            }
        } else {
            memberList = dashBoardBService.getBranchMembers();
            model.addAttribute("businessName", "전체 지점");
            System.out.println("로그인 정보가 없어 전체 직원 조회");
        }

        model.addAttribute("memberList", memberList);
        model.addAttribute("currentName", "대시보드");
        model.addAttribute("smallCurrentName","대시보드");
        return "branch/dashboard/dashboard";
    }

    @GetMapping("/mypage")
    public String redirectToBMyPage(@RequestParam(value = "userId", required = false) String userId) {
        return "redirect:/branch/mypage/myPage?userId=" + userId;
    }

}
