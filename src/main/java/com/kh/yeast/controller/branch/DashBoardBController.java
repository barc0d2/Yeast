package com.kh.yeast.controller.branch;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequiredArgsConstructor
@Controller
@RequestMapping("/branch/dashboard")
public class DashBoardBController {

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("currentName", "대시보드");
        model.addAttribute("smallCurrentName","대시보드");
        return "branch/dashboard/dashboard";
    }


    
}
