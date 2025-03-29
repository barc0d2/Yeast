package com.kh.yeast.controller.company;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
    @GetMapping("/company/product/enrollForm")
    public String enrollFormProduct() {
        return "company/product/enrollForm";
    }

    @GetMapping("/company/product/list")
    public String listProduct() {
        return "company/product/list";
    }

    @GetMapping("/company/product/updateForm")
    public String updateFormProduct() {
        return "company/product/updateForm";
    }
}