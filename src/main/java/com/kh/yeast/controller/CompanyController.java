package com.kh.yeast.controller;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class CompanyController {
    @GetMapping("/branch/introduce")
    public String Bintroduce(Model model) {
        model.addAttribute("currentName", "회사");
        model.addAttribute("smallCurrentName", "회사소개");
        return "branch/introduction/companyIntroduce";
    }

    @GetMapping("/company/introduce")
    public String Cintroduce(Model model) {
        model.addAttribute("currentName", "회사");
        model.addAttribute("smallCurrentName", "회사소개");
        return "company/introduction/companyIntroduce";
    }


}
