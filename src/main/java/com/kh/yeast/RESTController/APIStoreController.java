package com.kh.yeast.RESTController;

import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.service.branch.StoreBService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/store")
public class APIStoreController {

    private final StoreBService storeBService;

    @PostMapping("/insert")
    public String insertReply(Sell sell) {
        return storeBService.insertSell(sell)>0 ? "success" : "fail";
    }
}