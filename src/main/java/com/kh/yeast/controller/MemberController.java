package com.kh.yeast.controller;

import com.kh.yeast.service.MemberService;
import com.kh.yeast.domain.vo.Member;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {

    private final MemberService memberService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public MemberController(MemberService memberService, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.memberService = memberService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @PostMapping("insert.me")
    public String insertMember(Member member, HttpSession session, Model model) {

        String userPwd = bCryptPasswordEncoder.encode(member.getUserPwd());
        member.setUserPwd(userPwd);

        int result = memberService.insertMember(member);
        if (result > 0) {
            session.setAttribute("alertMsg", "회원가입 완료!");
            return "redirect:/";
        } else {
            model.addAttribute("errorMsg", "회원가입 실패");
            return "error";
        }

        }
    }

