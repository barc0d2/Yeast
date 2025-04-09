package com.kh.yeast.RESTController;

import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.service.branch.FinanceBService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/finance")
public class APIFinanceController {

    private final FinanceBService financeBService;

    @PostMapping("/insert")
    public String insertSell(Sell sell) throws Exception {
        return financeBService.insertSell(sell);
    }
}