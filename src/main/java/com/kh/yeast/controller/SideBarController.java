package com.kh.yeast.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@RequiredArgsConstructor
@Controller
public class SideBarController {
    @GetMapping("dashboard.sb")
    public String dashboard() {
        return "branch/dashboard/dashboard";
    }
}
