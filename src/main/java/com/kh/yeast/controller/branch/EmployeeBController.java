package com.kh.yeast.controller.branch;


import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.service.branch.MemberBService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Controller
public class  EmployeeBController {

    private final MemberBService memberBService;

    public EmployeeBController(MemberBService memberBService) {
        this.memberBService = memberBService;
    }

    @GetMapping("/branch/employee/enrollForm")
    public String enrollFormEmployee() {
        return "branch/employee/enrollForm";
    }

    @GetMapping("/branch/employee/list")
    public String listEmployee(@RequestParam(defaultValue = "1") int currentPage, Model model) {
        int memberCount = memberBService.selectMemberCount();

        PageInfo pi = new PageInfo(memberCount, currentPage, 10, 10);
        ArrayList<Member> list = memberBService.selectMemberList(pi);
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName","직원관리");
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "branch/employee/list";
    }

}