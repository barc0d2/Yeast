package com.kh.yeast.controller.branch;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DashBoardBController {

    @GetMapping("/branch/dashboard/dashboard")
    public String dashboard(Model model) throws Exception  {
        model.addAttribute("currentName", "대시보드");
        model.addAttribute("smallCurrentName","대시보드");
        return "branch/dashboard/dashboard";
    }

    @GetMapping("/dashboard/mypage")
    public String redirectToBMyPage(@RequestParam(value = "userId", required = false) String userId) throws Exception {
//        if (userId == null) {
//            return "redirect:/branch/errorPage";
//        }
        return "redirect:/branch/mypage/myPage?userId=" + userId;
    }

}
