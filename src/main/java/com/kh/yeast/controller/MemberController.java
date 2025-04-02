package com.kh.yeast.controller;

import com.kh.yeast.service.MemberService;
import com.kh.yeast.domain.vo.Member;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

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

    @PostMapping("login.me")
    public ModelAndView login(Member member, HttpSession session, ModelAndView modelAndView) {
        Member loginMember = null;
        try {
            loginMember = memberService.loginMember(member.getUserId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if(loginMember == null){
            modelAndView.addObject("errorMsg", "아이디를 찾을 수 없습니다.");
            modelAndView.setViewName("/common/errorPage");
        } else if(!bCryptPasswordEncoder.matches(member.getUserPwd(), loginMember.getUserPwd())){
            session.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
            modelAndView.setViewName("/common/errorPage");
        } else {
            session.setAttribute("loginUser", loginMember);
            if(loginMember.getUserId().startsWith("B")){
                modelAndView.setViewName("redirect:/branch/dashboard/dashboard");
            }else{
                modelAndView.setViewName("redirect:/company/dashboard/dashboard");
            }
        }
        return modelAndView;
    }

}

