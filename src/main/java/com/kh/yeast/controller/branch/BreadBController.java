package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.service.branch.BreadBService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
@RequestMapping("/branch/bread")
public class BreadBController{

    private final BreadBService breadBService;

    @GetMapping("/list")
    public String selectBreadList(@RequestParam(defaultValue = "1") int currentPage, Model model) throws Exception {
        Integer breadCount = breadBService.selectBreadCount();

        PageInfo pi = new PageInfo(breadCount, currentPage, 10, 6);
        ArrayList<Bread> list = breadBService.selectBreadList(pi);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        model.addAttribute("currentName", "메뉴관리");
        model.addAttribute("smallCurrentName","메뉴조회");
        return "branch/bread/list";
    }
}