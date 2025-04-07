package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.service.company.MonthlyFeeCService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/company/storemangement/specification/monthlyFee")
public class MonthlyFeeCController {

    private final MonthlyFeeCService monthlyFeeCService;

    public MonthlyFeeCController(MonthlyFeeCService monthlyFeeCService) {
        this.monthlyFeeCService = monthlyFeeCService;
    }

    @GetMapping("/{userNo}")
    public Map<String, Object> getPaySlip(@PathVariable Long userNo) {
        System.out.println("Received userNo: " + userNo);
        return monthlyFeeCService.getEmployeePaySlip(userNo);
    }

    @GetMapping("/monthlyFee")
    public String goToMonthlyFee(@RequestParam(value = "userName", required = false) String userName, Model model) {
        System.out.println("🚀 받은 요청 - userName: " + userName);
        Member employee = monthlyFeeCService.findByUserName(userName);
        if (employee == null) {
            System.out.println("❌ 해당 직원 정보 없음!");
            return "redirect:/errorPage";
        }

        Long businessNo = employee.getBusinessNo().longValue();

        Long totalSellMoney = monthlyFeeCService.getMonthlySellMoneyByBusinessNo(businessNo);
        if (totalSellMoney == null) {
            totalSellMoney = 80000000L;
            System.out.println("totalsellMoney: " + totalSellMoney);
        }

        Long salary = totalSellMoney * 5 / 100;

        Long money = monthlyFeeCService.getCompanyMoneyByUserNo(employee.getUserNo());

        Long remaining = (money - salary);

        model.addAttribute("employee", employee);
        model.addAttribute("totalSellMoney", totalSellMoney);
        model.addAttribute("salary", salary);
        model.addAttribute("money", money);
        model.addAttribute("remaining", remaining);

        System.out.println("받은 요청 employee: " + employee);
        return "company/storemangement/specification/monthlyFee/monthlyFee";
    }

    @GetMapping("/gototable")
    public String gototable() {
        return "company/storemangement/specification/Table/table";
    }

}
