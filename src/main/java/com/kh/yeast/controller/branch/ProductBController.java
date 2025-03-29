package com.kh.yeast.controller.branch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductBController {

    @GetMapping("/branch/product/list")
    public String listProduct() {
        return "branch/product/list";
    }
}