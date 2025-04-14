package com.kh.yeast.controller.company;

import com.kh.yeast.service.company.SpecificationCService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/company/specification")
public class SpecificationCController {

    private final SpecificationCService specificationCService;

    @GetMapping("/salaryList")
    public String salaryList(@RequestParam(defaultValue = "1")Integer cpage, Model model, String search, HttpSession session) throws Exception {
        specificationCService.salaryList(cpage, model, search, session);
        return "company/specification/salaryList";
    }

    @GetMapping("/salaryDetail")
    public String salaryDetail(Model model, Long userNo) throws Exception {
        specificationCService.salaryDetail(model, userNo);
        return "company/specification/salaryDetail";
    }

    @PostMapping("/payment")
    public String payment(Model model, Long userNo, String deduction) throws Exception {
        Integer intDeduction = Integer.parseInt(deduction.replace(",", ""));
        specificationCService.payment(model, userNo, intDeduction);
        return "redirect:/company/specification/salaryDetail?userNo=" + userNo;
    }

    @GetMapping("/monthlyFee")
    public String monthlyFeeDetail(@RequestParam(defaultValue = "2") Long businessNo, Model model) {
        specificationCService.monthlyFeeDetail(model, businessNo);
        return "company/specification/monthlyFeeDetail";
    }
}
