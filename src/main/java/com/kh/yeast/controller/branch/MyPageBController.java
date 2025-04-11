package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.service.branch.MyPageBService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequiredArgsConstructor
@Controller
@RequestMapping("/branch/myPage")
public class MyPageBController {

    private final MyPageBService myPageBService;


    @GetMapping
    public String myPage(int userNo, Model model) {
        Member member = myPageBService.selectMember(userNo);
        model.addAttribute("currentName", "마이페이지");
        model.addAttribute("smallCurrentName", "마이페이지");
        model.addAttribute("member", member);
        return "branch/myPage";
    }
}
