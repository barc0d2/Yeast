package com.kh.yeast.controller.company;

import com.kh.yeast.domain.entity.Employee;
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
    public String goToPaySlip(@RequestParam(value = "userName", required = false) String userName, Model model) {
        System.out.println("🚀 받은 요청 - userName: " + userName);

//        if (userName == null || userName.isEmpty()) {
//            System.out.println("❌ userName이 비어 있음!");
//            return "redirect:/errorPage";
//        }

        Employee employee = monthlyFeeCService.findByUserName(userName);

        if (employee == null) {
            System.out.println("❌ 해당 직원 정보 없음!");
            return "redirect:/errorPage";
        }

        model.addAttribute("employee", employee);

        System.out.println("🚀 받은 요청 - employee: " + employee);
        return "company/storemangement/specification/monthlyFee/monthlyFee";
    }
}
