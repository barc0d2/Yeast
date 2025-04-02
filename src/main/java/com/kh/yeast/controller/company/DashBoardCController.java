package com.kh.yeast.controller.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardCController {
    @GetMapping("/company/dashboard/dashboard")
    public String dashboard() {
        return "company/dashboard/dashboard";
    }

    @GetMapping("/company/mypage/myPage")
    public String myPage() {
        return "company/mypage/myPage";
    }
}
