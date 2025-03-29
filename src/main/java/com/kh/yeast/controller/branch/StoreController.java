package com.kh.yeast.controller.branch;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.stereotype.Controller;

@Controller
public class StoreController {

    @GetMapping("/branch/store/list")
    public String listStore() {
        return "branch/store/list";
    }
}