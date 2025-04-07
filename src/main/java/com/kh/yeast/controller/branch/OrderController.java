package com.kh.yeast.controller.branch;

import com.kh.yeast.service.branch.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@RequiredArgsConstructor
@Controller
public class OrderController {

    private final OrderService orderService;

    @GetMapping("/branch/order/list")
    public String orderManagement(Model model){
        model.addAttribute("currentName", "발주신청");
        model.addAttribute("smallCurrentName","발주신청내역");
        return "branch/order/list";
    }

    @GetMapping("/branch/order/orderPage")
    public String orderPage(Model model){
        model.addAttribute("currentName", "발주신청");
        model.addAttribute("smallCurrentName","발주신청");
        return "branch/order/orderPage";
    }
}
