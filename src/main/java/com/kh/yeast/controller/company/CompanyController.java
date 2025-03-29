package com.kh.yeast.controller.company;

import org.springframework.web.bind.annotation.GetMapping;

@org.springframework.stereotype.Controller
public class CompanyController {

    @GetMapping("/company/")
    public String home() {

        return "company/";
    }
}