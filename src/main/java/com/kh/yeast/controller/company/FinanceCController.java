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
        return "company/finance/storegraph";
    }

    @GetMapping("/detail")
    public String selectSellDetail(@RequestParam(defaultValue = "1")Integer cpage, Model model, Long businessNo,@RequestParam(defaultValue = "week") String period){

        model = financeCService.selectSellList(businessNo, cpage, period, model);

        if(model.containsAttribute("errorMsg")){
            return "errorPage";
        }else{
            return "company/finance/storedetail";
        }
    }

    @GetMapping("/wholesaleDetail")
    public String selectSellList(@RequestParam(defaultValue = "1") Integer cpage, Model model, Long businessNo,@RequestParam(defaultValue = "week") String period) throws Exception {

        model = financeCService.selectSellList(businessNo, cpage,period, model);

        if(model.containsAttribute("errorMsg")){
            return "errorPage";
        }else{
            return "company/finance/totalsaledetail";
        }
    }

    @GetMapping("/wholesaleChart")
    public String wholesalegraph(Model model){

        return "company/finance/wholesalegraph";
    }

}
