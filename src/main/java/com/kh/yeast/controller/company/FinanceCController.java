package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.*;
import com.kh.yeast.service.company.FinanceCService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
@RequestMapping("/company/finance")
public class FinanceCController {

    private final FinanceCService financeCService;

    @GetMapping("/chart")
    public String selectStoreList(Model model, @RequestParam(defaultValue = "1")Integer cpage)  {
        financeCService.selectRecentlySellList(model, cpage);
        if(model.containsAttribute("errorMsg")){
            return "errorPage";
        }
        return "company/finance/storegraph";
    }

    @GetMapping("/detail")
    public String selectSellDetail(@RequestParam(defaultValue = "1")Integer cpage, Model model, Long businessNo,@RequestParam(defaultValue = "week") String period){
        financeCService.selectSellList(businessNo, cpage, period, model);
        return "company/finance/storedetail";
    }

    @GetMapping("/wholesaleChart")
    public String wholesalegraph(Model model, @RequestParam(defaultValue = "1")Integer cpage){
        financeCService.selectRecentlyWholesaleList(model, cpage);
        return "company/finance/wholesalegraph";
    }

    @GetMapping("/wholesaleDetail")
    public String wholesaleDetail(@RequestParam(defaultValue = "1") Integer cpage, Model model, Long businessNo,@RequestParam(defaultValue = "week") String period) throws Exception {
        financeCService.wholesaleDetail(businessNo, cpage, period, model);
        return "company/finance/totalsaledetail";
    }
}
