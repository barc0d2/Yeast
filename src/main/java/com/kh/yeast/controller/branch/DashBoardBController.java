package com.kh.yeast.controller.branch;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardBController {

    @GetMapping("/branch/dashboard/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("currentName", "대시보드");
        model.addAttribute("smallCurrentName","대시보드");
        return "branch/dashboard/dashboard";
    }
    
}
