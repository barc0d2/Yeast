package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
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
    public String detail(HttpSession session, Model model) {

        model = specificationBService.detail(model, session);

        if(model.containsAttribute("errorMsg")) {
            return "errorPage";
        }

        return "branch/specification/detail";
    }

    @PostMapping("/branch/specification/pay")
    public String pay(HttpSession session, Model model, Integer money) throws Exception {
        model = specificationBService.updateMoney(session, model, money);

        return "branch/specification/detail";
    }
}
