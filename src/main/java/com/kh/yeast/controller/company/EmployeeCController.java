package com.kh.yeast.controller.company;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.stereotype.Controller;

@Controller
public class EmployeeCController {

    @GetMapping("/company/employee/enrollForm")
    public String enrollFormEmployee() {
        return "company/employee/enrollForm";
    }

    @GetMapping("/company/employee/list")
    public String listEmployee() {
        return "company/employee/list";
    }

}
