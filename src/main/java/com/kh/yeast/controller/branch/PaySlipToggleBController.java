package com.kh.yeast.controller.branch;

import com.kh.yeast.service.branch.PaySlipToggleBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/branch/storemangement/specification/payslipToggle")
public class PaySlipToggleBController {

    private final PaySlipToggleBService payslipToggleBService;

    public PaySlipToggleBController(PaySlipToggleBService payslipToggleBService) {
        this.payslipToggleBService = payslipToggleBService;
    }

    @GetMapping("/payslipToggle")
    public String paySlipToggle(@RequestParam("userNo") Long userNo, Model model) {
        Long salary = payslipToggleBService.getSalaryByUserNo(userNo);
        Long money = payslipToggleBService.getBranchMoneyByUserNo(userNo);
        Long remaining = money - salary;

        model.addAttribute("salary", salary);
        model.addAttribute("money", money);
        model.addAttribute("remaining", remaining);
        model.addAttribute("userNo", userNo);

        return "branch/storemangement/specification/payslipToggle/payslipToggle";
    }

    @PostMapping("/send")
    public String sendSalary(@RequestParam("userNo") Long userNo,
                             @RequestParam("salary") int salary,
                             Model model) {

        boolean success = payslipToggleBService.deductSalaryFromBranch(userNo, salary);

        if (success) {
            return "redirect:/branch/storemangement/specification/table/table";
        } else {
            model.addAttribute("errorMessage", "송금 실패");
            return "branch/storemangement/specification/payslipToggle/payslipToggle";
        }
    }

    @GetMapping("/cancel")
    public String cancel(@RequestParam("userNo") Long userNo) {

        return "redirect:/branch/storemangement/specification/table/table";
    }
}
