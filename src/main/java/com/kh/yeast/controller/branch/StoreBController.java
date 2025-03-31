package com.kh.yeast.controller.branch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreBController {

    @GetMapping("/branch/")
    public String home() {

        return "branch/";
    }
}