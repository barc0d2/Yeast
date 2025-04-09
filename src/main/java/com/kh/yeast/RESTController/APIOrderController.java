package com.kh.yeast.RESTController;

import com.kh.yeast.domain.vo.Supply;
import com.kh.yeast.service.branch.OrderBService;
import lombok.RequiredArgsConstructor;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/order")
public class APIOrderController {

    private final OrderBService orderBService;

    @PostMapping("/insert")
    public String insert(Supply supply) {
        try{
            return orderBService.insert(supply);
        }catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }






}
