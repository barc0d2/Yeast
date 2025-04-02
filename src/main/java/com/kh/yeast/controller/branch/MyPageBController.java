package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.entity.Member;
import com.kh.yeast.service.branch.MyPageBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
    @RequestMapping("/branch")
    public class MyPageBController {

        private final MyPageBService myPageBService;

        @Autowired
        public MyPageBController(MyPageBService myPageBService) {
            this.myPageBService = myPageBService;
        }

        @GetMapping
        public String showBMyPage(String userId, Model model) throws Exception {
            Member member = myPageBService.getBMemberInfo(userId);
            String managerName = myPageBService.getBManagerName(member.getUserNo());
            model.addAttribute("member", member);
            model.addAttribute("managerName", managerName);
            return " mypage/myPage";
        }

        @GetMapping("/mypage/myPagePopUp")
        public String showBMyPagePopUp(Long userNo, Model model) throws Exception {
            Member member = myPageBService.getBMemberInfoByUserNo(userNo);
            String managerName = myPageBService.getBManagerName(member.getUserNo());
            model.addAttribute("member", member);
            model.addAttribute("managerName", managerName);
            return " mypage/myPagePopUp";
        }

        @PostMapping("/mypage/myPage")
        public String updateBMyPage(Member member) throws Exception {
            myPageBService.updateBMemberInfo(member);
            return "redirect: mypage/myPage?userId=" + member.getUserId();
        }
    }




