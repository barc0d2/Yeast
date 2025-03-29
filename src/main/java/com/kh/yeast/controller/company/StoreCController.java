package com.kh.yeast.controller.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreCController {
    @GetMapping("/company/store/enrollForm")
    public String enrollFormStore() {
        return "company/store/enrollForm";
    }

    @GetMapping("/company/store/list")
    public String listStore() {
        return "company/store/list";
    }

    @GetMapping("/company/store/updateForm")
    public String updateFormStore() {
        return "company/store/updateForm";
    }
}