package com.kh.yeast.controller.branch;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EmployeeController {

    @GetMapping("/branch/employee/enrollForm")
    public String enrollFormEmployee() {
        return "branch/employee/enrollForm";
    }

    @GetMapping("/branch/employee/list")
    public String listEmployee() {
        return "branch/employee/list";
    }

}