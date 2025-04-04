package com.kh.yeast.controller;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequiredArgsConstructor
@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;


    @GetMapping("/agreement")
    public String showAgreement() {
        log.info("약관 동의 페이지 요청");
        return "register/agreement";
    }

    @GetMapping("/check-id")
    @ResponseBody
    public String checkMemberId(String checkId) {
        Integer result = memberService.idCheck(checkId);

        if (result > 0) {
            return "NNNNN";
        } else {
            return "NNNNY";
        }
    }

    @GetMapping("/check-email")
    @ResponseBody
    public String checkEmail(String checkEmail) {
        Integer result = memberService.emailCheck(checkEmail);

        if (result > 0) {
            return "NNNNN";
        } else {
            return "NNNNY";
        }
    }

    @GetMapping("/check-manager")
    @ResponseBody
    public boolean checkManager(String managerName) {
        Member manager = memberService.findManagerByName(managerName);
        return manager != null;
    }

    @PostMapping("/register")
    @ResponseBody
    public String insertMember(Member member, HttpSession session, Model model) {
        // 사수 이름으로 사수 번호 찾기
        if (member.getManagerName() != null && !member.getManagerName().trim().isEmpty()) {
            Member manager = memberService.findManagerByName(member.getManagerName());
            if (manager != null) {
                member.setManagerNo(manager.getUserNo());
            }
        }

        String pwd = bCryptPasswordEncoder.encode(member.getUserPwd());
        member.setUserPwd(pwd);

        Integer result = memberService.insertMember(member);
        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 회원가입을 완료하였습니다.");
            session.setAttribute("alertMsg", "회원가입 완료!");
            return "redirect:/";
        } else {
            model.addAttribute("errorMsg", "회원가입 실패");
            return "error";
        }
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        log.info("회원가입 페이지 요청");
        model.addAttribute("positions", memberService.getAllPositions());
        model.addAttribute("businesses", memberService.getAllBusinesses());
        return "register/register";
    }

    @PostMapping("/login")
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

