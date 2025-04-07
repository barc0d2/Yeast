package com.kh.yeast.controller.company;

import com.kh.yeast.domain.entity.Member;
import com.kh.yeast.service.company.MyPageCService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class MyPageCController {

    private final MyPageCService myPageCService;

    @Autowired
    public MyPageCController(MyPageCService myPageCService) {
        this.myPageCService = myPageCService;
    }


    @GetMapping
    public String showCMyPage(String userId, Model model) throws Exception {
        Member member = myPageCService.getCMemberInfo(userId);
        String managerName = myPageCService.getCManagerName(member.getUserNo());
        model.addAttribute("member", member);
        model.addAttribute("managerName", managerName);
        return "mypage/myPage";
    }

    @GetMapping("/mypage/myPagePopUp")
    public String showCMyPagePopUp(Long userNo, Model model) throws Exception {
        Member member = myPageCService.getCMemberInfoByUserNo(userNo);
        String managerName = myPageCService.getCManagerName(member.getUserNo());
        model.addAttribute("member", member);
        model.addAttribute("managerName", managerName);
        return "mypage/myPagePopUp";
    }

    @PostMapping("/mypage/myPage")
    public String updateCMyPage(Member member) throws Exception {
        myPageCService.updateCMemberInfo(member);
        return "redirect: mypage/myPage?userId=" + member.getUserId();
    }
}
