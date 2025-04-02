package com.kh.yeast.controller.branch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardBController {

    @GetMapping("/branch/dashboard/dashboard")
    public String dashboard() {
        return "branch/dashboard/dashboard";
    }

    @GetMapping("/branch/mypage/myPage")
    public String myPage() {
        return "branch/mypage/myPage";
    }
}
