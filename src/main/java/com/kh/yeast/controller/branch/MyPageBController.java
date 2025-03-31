package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Position;
import com.kh.yeast.service.MyPageService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class MyPageBController {

    @Autowired
    private MyPageService myPageService;

    @GetMapping("/branch/mypage/myPage")
    public String myPage(@SessionAttribute(value = "userId", required = false) String userId, Model model) {
        Member user = myPageService.getUserById(userId);
        if (user != null) {
            Position position = myPageService.getPositionById(user.getPositionNo());
            Business business = myPageService.getBusinessById(user.getBusinessNo());

            model.addAttribute("user", user);
            model.addAttribute("position", position != null ? position.getPositionName() : "직무 미지정");
            model.addAttribute("business", business != null ? business.getBusinessName() : "부서 미지정");
        }

        return "branch/mypage/myPage";
    }

    @GetMapping("/branch/mypage/myPagePopUp")
    public String editUserPage(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");

        if (userId != null) {
            Member user = myPageService.getUserById(userId);
            Position position = myPageService.getPositionById(user.getPositionNo());
            Business department = myPageService.getBusinessById(user.getBusinessNo());

            model.addAttribute("user", user);
            model.addAttribute("position", position != null ? position.getPositionName() : "직무 미지정");
            model.addAttribute("department", department != null ? department.getBusinessName() : "부서 미지정");
        }

        return "branch/mypage/myPagePopUp";
    }
}
