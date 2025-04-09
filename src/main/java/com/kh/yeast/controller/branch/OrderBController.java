package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Supply;
import com.kh.yeast.service.branch.OrderBService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Controller
public class OrderBController {

    private final OrderBService orderBService;

    @GetMapping("/branch/order/list")
    public String orderManagement(@RequestParam(defaultValue = "1") int currentPage, Model model){
        model.addAttribute("currentName", "발주신청");
        model.addAttribute("smallCurrentName","발주신청내역");

        int orderCount = orderBService.selectOrderCount();

        PageInfo pi = new PageInfo(orderCount, currentPage, 10, 10);
        ArrayList<Supply> list = orderBService.selectOrderList(pi);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "branch/order/list";
    }

    @GetMapping("/branch/order/orderPage")
    public String orderPage(Model model){
        model.addAttribute("currentName", "발주신청");
        model.addAttribute("smallCurrentName","발주신청");
        ArrayList<Supply> list = orderBService.selectValue();
        System.out.println(list);
        model.addAttribute("list", list);

        List<String> categoryList = list.stream()
                .map(Supply::getCategoryName)
                .distinct()
                .collect(Collectors.toList());

        model.addAttribute("categoryList", categoryList);

        return "branch/order/orderPage";
    }
}
