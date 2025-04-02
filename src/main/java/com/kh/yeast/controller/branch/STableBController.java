package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.entity.Employee;
import com.kh.yeast.service.branch.STableBService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/branch/storemangement/specification/table")
public class STableBController {

    private final STableBService employeeBService;

    public STableBController(STableBService employeeBService) {
        this.employeeBService = employeeBService;
    }

    @GetMapping("/table")
    public String specificationTable() {
        return "branch/storemangement/specification/table/table";
    }

    @GetMapping("/searchByName")
    public ResponseEntity<?> searchByName(@RequestParam String userName) {
        System.out.println("[Controller] searchByName 실행됨! 받은 userName: '" + userName + "'");

        List<Employee> employees = employeeBService.findEmployeesByName(userName);

        System.out.println("🔍 검색된 직원 리스트 (백엔드): " + employees);

        return ResponseEntity.ok(employees);
    }



}
