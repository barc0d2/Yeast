package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.service.branch.BreadBService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class BreadBController {

    private final BreadBService breadBService;

    @GetMapping("/branch/bread/list")
    public String selectBreadList(@RequestParam(defaultValue = "1") int currentPage, Model model) {
        Integer breadCount = breadBService.selectBreadCount();

        PageInfo pi = new PageInfo(breadCount, currentPage, 10, 6);
        ArrayList<Bread> list = breadBService.selectBreadList(pi);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "branch/bread/list";
    }
}