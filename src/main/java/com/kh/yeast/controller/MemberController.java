package com.kh.yeast.controller;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import lombok.extern.slf4j.Slf4j;

import org.springframework.security.crypto.password.PasswordEncoder;



@RequiredArgsConstructor
@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;
    private final PasswordEncoder passwordEncoder;



    @GetMapping("/agreement")
    public String showAgreement() {
        log.info("약관 동의 페이지 요청");
        return "register/agreement";
    }

    @GetMapping("/register")
    public String showRegisterForm() {
        log.info("회원가입 페이지 요청");
        return "register/register";
    }

    @GetMapping("/check-id")
    @ResponseBody
    public String checkMemberId(String checkId) {
        int result = memberService.idCheck(checkId);

        if (result > 0) {
            return "NNNNN";
        } else {
            return "NNNNY";
        }
    }

    @PostMapping("/register")
    @ResponseBody
    public String insertMember(Member member, HttpSession session, Model model) {

        String pwd = passwordEncoder.encode(member.getUserPwd());
        member.setUserPwd(pwd);

        int result = memberService.insertMember(member);
        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 회원가입을 완료하였습니다.");
            return "redirect:/";
        } else {
            model.addAttribute("errorMsg", "회원가입 실패");
            return "common/errorPage";

        }

    }
}