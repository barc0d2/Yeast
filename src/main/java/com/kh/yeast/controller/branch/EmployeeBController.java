package com.kh.yeast.controller.branch;


import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.service.branch.EmployeeBService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Controller
@RequestMapping("/branch/employee")
public class  EmployeeBController {

    private final EmployeeBService employeeBService;

    public EmployeeBController(EmployeeBService employeeBService) {
        this.employeeBService = employeeBService;
    }

    @GetMapping("/enrollForm")
    public String enrollFormEmployee() {
        return "branch/employee/enrollForm";
    }

    @GetMapping("/list")
    public String listEmployee(@RequestParam(defaultValue = "1") int currentPage, Model model) {
        int memberCount = employeeBService.selectMemberCount();

        PageInfo pi = new PageInfo(memberCount, currentPage, 10, 10);
        ArrayList<Member> list = employeeBService.selectMemberList(pi);
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName","직원관리");
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "branch/employee/list";
    }

}