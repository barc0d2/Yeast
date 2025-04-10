package com.kh.yeast.controller.company;

import com.kh.yeast.service.company.SpecificationCService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/company/specification")
public class SpecificationCController {

    private final SpecificationCService specificationCService;

    @GetMapping("/list")
    public String specificationList(@RequestParam(defaultValue = "1") Integer cpage, Model model, String search) throws Exception {
        specificationCService.specificationList(cpage, model, search);
        return "company/specification/list";
    }

    @GetMapping("/detail")
    public String detail(Model model, Long userNo) throws Exception {
        specificationCService.detail(model, userNo);
        return "company/specification/detail";
    }

    @GetMapping("/monthlyFee")
    public String monthlyFee(@RequestParam(defaultValue = "2") Long businessNo, Model model) {
        specificationCService.monthlyFee(model, businessNo);
        return "company/specification/monthlyFee";
    }
}
