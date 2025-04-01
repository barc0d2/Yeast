package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.entity.Member;
import com.kh.yeast.service.MyPageBService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MyPageBController {

    private final MyPageBService myPageBService;

    @Autowired
    public MyPageBController(MyPageBService myPageBService) {
        this.myPageBService = myPageBService;
    }

    @GetMapping("/branch/mypage/myPage")
    public String myPage(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");

//        if (userId == null) {
//            model.addAttribute("error", "세션이 만료되었거나 유효하지 않습니다.");
//            return "redirect:/login";
//        }

        try {
            Member user = myPageBService.getBMemberInfo(userId);
            if (user != null) {
                model.addAttribute("user", user);
                model.addAttribute("position", user.getPosition() != null ? user.getPosition() : "직무 미지정");
                model.addAttribute("business", user.getBusiness() != null ? user.getBusiness() : "부서 미지정");
            } else {
                model.addAttribute("error", "회원 정보를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            model.addAttribute("error", "회원 정보를 불러오는 데 실패했습니다.");
        }

        Long userNo = (Long) session.getAttribute("userNo");
        if (userNo != null) {
            String managerName = myPageBService.getBManagerName(userNo);
            model.addAttribute("managerName", managerName);
        } else {
            model.addAttribute("managerName", "사수 정보 없음");
        }

        return "branch/mypage/myPage";
    }

    @PostMapping("/branch/mypage/myPagePopUp")
    public String saveUserInfo(Member member, HttpSession session) {
        String userId = (String) session.getAttribute("userId");

        try {
            myPageBService.updateBMemberInfo(member);
        } catch (Exception e) {
            session.setAttribute("error", "회원 정보를 저장하는데 실패했습니다.");
            return "redirect:/branch/mypage/myPagePopUp";
        }

        return "redirect:/branch/mypage/myPage";
    }


    @GetMapping("/branch/mypage/myPagePopUp")
    public String editUserPage(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");

        if (userId != null) {
            try {
                Member user = myPageBService.getBMemberInfo(userId);
                model.addAttribute("user", user);
                model.addAttribute("position", user.getPosition() != null ? user.getPosition() : "직무 미지정");
                model.addAttribute("business", user.getBusiness() != null ? user.getBusiness() : "부서 미지정");
            } catch (Exception e) {
                model.addAttribute("error", "회원 정보를 불러오는 데 실패했습니다.");
            }
        }

        return "branch/mypage/myPagePopUp";
    }
}
