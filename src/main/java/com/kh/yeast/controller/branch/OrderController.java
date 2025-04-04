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

    @GetMapping("/branch/order/orderManagement")
    public String orderManagement(Model model){

    }
}
