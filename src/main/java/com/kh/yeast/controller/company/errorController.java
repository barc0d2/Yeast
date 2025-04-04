package com.kh.yeast.controller.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class errorController {

    @GetMapping("/errorPage")
    public String error() {
        return "errorPage";
    }
}
