package com.kh.yeast.controller.company;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardCController {
    @GetMapping("/company/dashboard/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("currentName", "대시보드");
        model.addAttribute("smallCurrentName","대시보드");
        return "company/dashboard/dashboard";
    }

    @GetMapping("production.cd")
    public String production(Model model) {



        return "redirect:/";
    }
}
