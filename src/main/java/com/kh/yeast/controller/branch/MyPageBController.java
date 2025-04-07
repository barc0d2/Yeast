package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.entity.Member;
import com.kh.yeast.service.branch.MyPageBService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/branch")
public class MyPageBController {

    private final MyPageBService myPageBService;

    @Autowired
    public MyPageBController(MyPageBService myPageBService) {
        this.myPageBService = myPageBService;
    }

    @GetMapping("/mypage/myPage")
    public String showBMyPage(
            @RequestParam(value = "userNo", required = false) Long userNo,
            HttpServletRequest request,
            Model model
    ) throws Exception {
        if (userNo == null) {
            System.out.println("⚠️ userNo가 null이라 30L로 대체합니다 (임시)");
            userNo = 30L;
        }

        Member member = myPageBService.getBMemberInfo(userNo);

        if (member == null) {
            System.out.println("❌ 해당 userNo(" + userNo + ")에 대한 회원 정보 없음!");
            return "redirect:/branch/errorPage";
        }

        Member managerName = myPageBService.getBManagerName(userNo);

        model.addAttribute("member", member);
        model.addAttribute("managerName", managerName);

        return "branch/mypage/myPage";
    }

    @GetMapping("/mypage/myPagePopUp")
    public String showBMyPagePopUp(@RequestParam(value = "userNo", required = false) Long userNo, HttpServletRequest request) throws Exception {
        if (userNo == null) {
            System.out.println("❌ userNo가 null입니다! 임시로 30L을 사용합니다.");
            userNo = 30L;
        }

        Member member = myPageBService.getBMemberInfo(userNo);

        Member managerName = myPageBService.getBManagerName(member.getUserNo());

        request.setAttribute("email", member.getEmail());
        request.setAttribute("name", member.getUserName());
        request.setAttribute("userId", member.getUserId());
        request.setAttribute("password", member.getUserPwd() );
        request.setAttribute("address", member.getAddress());
        request.setAttribute("phone", member.getPhone());
        request.setAttribute("birthdate", member.getBirthday());
        request.setAttribute("position", member.getPositionNo());
        request.setAttribute("business", member.getBusinessNo());
        request.setAttribute("gender", member.getGender());
        request.setAttribute("managerName", managerName);

        return "branch/mypage/myPagePopUp";
    }

    @PostMapping("/mypage/myPage")
    public String updateBMyPage(Member member) throws Exception {
        myPageBService.updateBMemberInfo(member);
        return "redirect:/branch/mypage/myPage?userId=" + member.getUserId();
    }
}
