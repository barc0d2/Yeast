package com.kh.yeast.controller.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IntroduceCController {
    @GetMapping("/company/introduction/companyIntroduce")
    public String companyIntroduce() {
        return "company/introduction/companyIntroduce";
    }
}
