package com.kh.yeast.controller.branch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardBController {

    @GetMapping("/branch/dashboard/dashboard")
    public String enrollForm() {
        return "branch/dashboard/dashboard";
    }
    
}
