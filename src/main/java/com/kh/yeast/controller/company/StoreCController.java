package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.service.company.StoreCService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class StoreCController {

    private final StoreCService storeCService;

    @GetMapping("/company/store/enrollForm")
    public String enrollFormStore() {
        return "company/store/enrollForm";
    }

    @GetMapping("/company/store/list")
    public String listStore(@RequestParam(defaultValue = "1") int cpage, Model model) {
        int listCount = storeCService.selectStoreCount();

        PageInfo pi = new PageInfo(listCount, cpage, 10, 6);
        ArrayList<Business> list = storeCService.selectStoreList(pi);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "company/store/list";
    }

    @GetMapping("/company/store/updateForm")
    public String updateFormStore() {
        return "company/store/updateForm";
    }
}