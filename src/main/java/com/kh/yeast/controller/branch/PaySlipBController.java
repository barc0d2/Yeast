package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.service.branch.PaySlipBService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;


@Controller
@RequestMapping("/branch/storemangement/specification/payslip")
public class PaySlipBController {

    private final PaySlipBService payslipBService;

    public PaySlipBController(PaySlipBService payslipBService) {
        this.payslipBService = payslipBService;
    }

    @GetMapping("/{userNo}")
    public Map<String, Object> getPaySlip(@PathVariable Long userNo) {
        System.out.println("Received userNo: " + userNo);
        return payslipBService.getEmployeePaySlip(userNo);
    }

    @GetMapping("/paySlip")
    public String goToPaySlip(@RequestParam(value = "userName", required = false) String userName, Model model) {
        System.out.println("🚀 받은 요청 - userName: " + userName);

        if (userName == null || userName.isEmpty()) {

            return "redirect:/errorPage";
        }

        Member employee = payslipBService.findByUserName(userName);

        if (employee == null) {
            System.out.println("❌ 해당 직원 정보 없음!");
            return "redirect:/errorPage";
        }

        model.addAttribute("employee", employee);
        System.out.println("🚀 받은 요청 - employee: " + employee);
        return "detail";
    }

}
