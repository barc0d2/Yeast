package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.service.company.SpecificationCService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/company/specification")
public class SpecificationCController {

    private final SpecificationCService specificationCService;

    @GetMapping("/list")
    public String specificationList(@RequestParam(defaultValue = "1") Integer cpage, Model model) {
        Integer employeeCount = specificationCService.selectEmployeeCount();

        PageInfo pi = new PageInfo(employeeCount, cpage, 10, 10);
        ArrayList<Member> list = specificationCService.getEmployeeList(pi);
        model.addAttribute("employees", list);
        return "company/specification/list";
    }

    @GetMapping("/searchByName")
    public ResponseEntity<?> searchByName(@RequestParam String userName) {
        List<Member> employees = specificationCService.findEmployeesByName(userName);
        System.out.println(employees);
        System.out.println("🔍 검색 요청 userName: " + userName);

        employees.forEach(emp -> System.out.println("🔍 검색된 직원: " + emp));

        if (employees.isEmpty()) {
            return ResponseEntity.ok(Collections.emptyList());
        }

        return ResponseEntity.ok(employees);
    }
}
