package com.kh.yeast.RESTController;

import com.kh.yeast.domain.vo.Supply;
import com.kh.yeast.service.branch.OrderBService;
import com.kh.yeast.service.company.DispatchCService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class APISupplyController {

    private final OrderBService orderBService;

    private final DispatchCService dispatchCService;

    @PostMapping("/order/insert")
    public String insert(Supply supply) {
        try{
            return orderBService.insert(supply);
        }catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }

    @GetMapping("/order/night")
    public int night() {
        return orderBService.night();
    }








}
