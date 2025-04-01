package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class EmployeeCController {

    private final MemberService memberService;


    @GetMapping("/company/employee/enrollForm")
    public String enrollFormEmployee() {

        return "company/employee/enrollForm";
    }

    @GetMapping("/company/employee/list")
    public String listEmployee(@RequestParam(defaultValue = "1") int cpage, Model model) {

        int memberCount = memberService.selectMemberCount();

        PageInfo pi = new PageInfo(memberCount, cpage, 10, 5);
        ArrayList<Member> list = memberService.selectMemberList(pi);

        model.addAttribute("list", list);
        model.addAttribute("pageInfo", pi);
        return "company/employee/list";
    }

}
