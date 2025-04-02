package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.service.company.MemberCService;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class EmployeeCController {

    private final MemberCService memberCService;


    @GetMapping("/company/employee/enrollForm")
    public String enrollFormEmployee(int userNo, Model model) {
        Member m = memberCService.selectMember(userNo);
        model.addAttribute("m", m);
        return "company/employee/enrollForm";
    }

    @GetMapping("/company/employee/list")
    public String listEmployee(@RequestParam(defaultValue = "1") int currentPage, Model model) {
        int memberCount = memberCService.selectMemberCount();

        PageInfo pi = new PageInfo(memberCount, currentPage, 10, 10);
        ArrayList<Member> list = memberCService.selectMemberList(pi);
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName","직원관리");
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "company/employee/list";
    }

}
