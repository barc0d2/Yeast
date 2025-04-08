package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.service.company.STableCService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/company/specification")
public class STableCController {

    private final STableCService stableCService;

    @Autowired
    public STableCController(STableCService stableCService) {
        this.stableCService = stableCService;
    }


    @GetMapping("/Table/searchByName")
    public ResponseEntity<?> searchByName(@RequestParam String userName) {
        List<Member> employees = stableCService.findEmployeesByName(userName);
        System.out.println(employees);
        System.out.println("🔍 검색 요청 userName: " + userName);

        employees.forEach(emp -> System.out.println("🔍 검색된 직원: " + emp));

        if (employees.isEmpty()) {
            return ResponseEntity.ok(Collections.emptyList());
        }

        return ResponseEntity.ok(employees);
    }
}
