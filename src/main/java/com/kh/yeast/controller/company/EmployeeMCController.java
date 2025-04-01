package com.kh.yeast.controller.company;

import com.kh.yeast.domain.entity.Employee;
import com.kh.yeast.service.EmployeeMService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class EmployeeMCController {

    private final EmployeeMService employeeMService;

    @GetMapping("/company/introduction/employeeManagement")
    public ResponseEntity<List<Employee>> getEmployees(
            @RequestParam(required = false) String business,
            @RequestParam(required = false) String position,
            @RequestParam(required = false) String enrollDate,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size) throws Exception {

        int offset = (page - 1) * size;
        List<Employee> employees = employeeMService.getFilteredEmployees(business, position, enrollDate, offset, size);
        return ResponseEntity.ok(employees);
    }
}
