package com.kh.yeast.controller.branch;

import com.kh.yeast.service.branch.SpecificationBService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/branch/specification")
public class SpecificationBController {

    private final SpecificationBService specificationBService;
    @GetMapping("/salaryList")
    public String salaryList(@RequestParam(defaultValue = "1")Integer cpage, Model model, String search, HttpSession session) throws Exception {
        specificationBService.salaryList(cpage, model, search, session);
        return "branch/specification/salaryList";
    }

    @GetMapping("/salaryDetail")
    public String salaryDetail(Model model, Long userNo, HttpSession session) throws Exception {
        specificationBService.salaryDetail(model, userNo, session);
        return "branch/specification/salaryDetail";
    }

    @PostMapping("/payment")
    public String payment(Model model, Long userNo, String deduction, HttpSession session) throws Exception {
        Integer intDeduction = Integer.parseInt(deduction.replace(",", ""));
        specificationBService.payment(model, userNo, intDeduction, session);
        return "redirect:/company/specification/salaryDetail?userNo=" + userNo;
    }

    @GetMapping("/monthlyFee")
    public String monthlyFee(HttpSession session, Model model) throws Exception{
        specificationBService.monthlyFee(model, session);
        return "branch/specification/monthlyFee";
    }

    @PostMapping("/monthlyFeePay")
    public String monthlyFeePay(HttpSession session, Model model, Integer money) throws Exception {
        specificationBService.updateMoney(session, model, money);
        return "redirect:/branch/specification/monthlyFee";
    }
}
