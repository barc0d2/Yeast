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

    @GetMapping("/storeGraph")
    public String selectStoreList(Model model) {
        ArrayList<Sell> list = financeCService.selectRecentlySellList();
        model.addAttribute("list", list);
        model.addAttribute("currentName", "재무관리");
        model.addAttribute("smallCurrentName","회사 매출");
        if(list.size() > 0){
            return "company/finance/storegraph";
        } else {
            model.addAttribute("errorMsg", "회사 매출 데이터 불러오기 실패");
            return "common/errorPage";
        }
    }

    @GetMapping("/totalSaleDetail")
    public String selectSellList(@RequestParam(defaultValue = "1") Integer cpage, Model model, Long businessNo,@RequestParam(defaultValue = "week") String period){

        model = financeCService.selectSellList(businessNo, cpage,period, model);

        if(model.containsAttribute("errorMsg")){
            return "common/errorPage";
        }else{
            return "company/finance/totalsaledetail";
        }
    }

    @GetMapping("/wholesalegraph")
    public String wholesalegraph(Model model){

        return "company/finance/wholesalegraph";
    }

    @GetMapping("/storeDetail")
    public String selectSellDetail(@RequestParam(defaultValue = "1") Integer cpage, Model model, Long businessNo,@RequestParam(defaultValue = "week") String period){

        model = financeCService.selectSellList(businessNo, cpage, period, model);

        if(model.containsAttribute("errorMsg")){
            return "common/errorPage";
        }else{
            return "company/finance/storedetail";
        }
    }
}
