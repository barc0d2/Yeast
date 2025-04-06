package com.kh.yeast.controller.branch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DashBoardBController {

    @GetMapping("/branch/dashboard/dashboard")
    public String dashboard() {
        return "branch/dashboard/dashboard";
    }

    @GetMapping("/dashboard/mypage")
    public String redirectToBMyPage(@RequestParam(value = "userId", required = false) String userId) {
//        if (userId == null) {
//            return "redirect:/branch/errorPage";
//        }
        return "redirect:/branch/mypage/myPage?userId=" + userId;
    }

}
