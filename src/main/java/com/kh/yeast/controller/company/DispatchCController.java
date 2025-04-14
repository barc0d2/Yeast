package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Supply;
import com.kh.yeast.service.company.DispatchCService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Controller
@RequestMapping("/company/dispatch")
public class DispatchCController {

    private final DispatchCService dispatchCService;

    @GetMapping("list")
    public String list(@RequestParam(defaultValue = "1") int currentPage, Model model) {
        model.addAttribute("currentName", "출하관리");
        model.addAttribute("smallCurrentName","출하관리");

        int dispatchCount = dispatchCService.selectDispatchCount();
        System.out.println("currentPage = " + currentPage);
        PageInfo pi = new PageInfo(dispatchCount, currentPage, 10, 10);
        ArrayList<Supply> list = dispatchCService.selectDispatchList(pi);
        System.out.println("디스패치 리스트 크기: " + list.size());
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "company/dispatch/list";
    }

    @GetMapping("/approval")
    public String approvalForm(int supplyNo, Model model) throws Exception  {
        ArrayList<Supply> supply = dispatchCService.selectSupply(supplyNo);
        Supply list = dispatchCService.selectSupplyInfo(supplyNo);
        model.addAttribute("currentName", "출하관리");
        model.addAttribute("smallCurrentName","출하관리");
        model.addAttribute("supply", supply);
        model.addAttribute("list", list);
        System.out.println(list);
        return "company/dispatch/approval";
    }

    @PostMapping("/approvalOk")
    public String approval( @RequestParam("branchNo") long branchNo,
                            @RequestParam("breadNo") List<Integer> breadNos,
                            @RequestParam("quantity") List<Integer> quantities,
                            int supplyNo) {
        int result1 = 0;
        System.out.println("branchNo = " + branchNo);
        for(int i = 0; i < breadNos.size(); i++) {
            int breadNo = breadNos.get(i);
            int quantity = quantities.get(i);
            result1 += dispatchCService.updateInventory((int) branchNo, breadNo, quantity);
        }
        int result2 = dispatchCService.approval(supplyNo);
        if(result1 * result2 != 0){
            return "redirect:approval?supplyNo=" + supplyNo;
        } else{
            return "error";
        }
    }
}
