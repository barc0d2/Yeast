package com.kh.yeast.RESTController;

import com.kh.yeast.domain.vo.Supply;
import com.kh.yeast.service.branch.OrderBService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/order")
public class APIOrderController {

    private final OrderBService orderBService;




}
