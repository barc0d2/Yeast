package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.service.MyPageService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class MyPageCController {

    @Autowired
    private MyPageService myPageService;

    @GetMapping("/company/mypage/myPage")
    public String myPage(@SessionAttribute(value = "userId", required = false) String userId, Model model) {
        try {
            Member user = myPageService.getMemberInfo(userId);
            if (user != null) {
                model.addAttribute("user", user);
                model.addAttribute("position", user.getPosition() != null ? user.getPosition() : "직무 미지정");
                model.addAttribute("business", user.getBusiness() != null ? user.getBusiness() : "부서 미지정");
            }
        } catch (Exception e) {
            model.addAttribute("error", "회원 정보를 불러오는 데 실패했습니다.");
        }

        return "company/mypage/myPage";
    }

    @GetMapping("/company/mypage/myPagePopUp")
    public String editUserPage(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");

        if (userId != null) {
            try {
                Member user = myPageService.getMemberInfo(userId);
                model.addAttribute("user", user);
                model.addAttribute("position", user.getPosition() != null ? user.getPosition() : "직무 미지정");
                model.addAttribute("business", user.getBusiness() != null ? user.getBusiness() : "부서 미지정");
            } catch (Exception e) {
                model.addAttribute("error", "회원 정보를 불러오는 데 실패했습니다.");
            }
        }

        return "company/mypage/myPagePopUp";
    }
}
