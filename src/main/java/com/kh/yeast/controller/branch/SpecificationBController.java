package com.kh.yeast.controller.branch;

import com.kh.yeast.service.branch.SpecificationBService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/branch/specification")
public class SpecificationBController {

    private final SpecificationBService specificationBService;

    @GetMapping("/detail")
    public String detail(HttpSession session, Model model) throws Exception{
        specificationBService.detail(model, session);
        return "branch/specification/detail";
    }

    @PostMapping("/pay")
    public String pay(HttpSession session, Model model, Integer money) throws Exception {
        specificationBService.updateMoney(session, model, money);
        return "redirect:/branch/specification/detail";
    }
}
