package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.Member;
import org.springframework.ui.Model;
import com.kh.yeast.service.branch.STableBService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/branch/storemangement/specification")
public class STableBController {

    private final STableBService stableBService;

    public STableBController(STableBService stableBService) {
        this.stableBService = stableBService;
    }

    @GetMapping("/table/table")
    public String specificationTable() {
        return "branch/storemangement/specification/table/table";
    }

    @GetMapping("/table/searchByName")
    public ResponseEntity<?> searchByName(@RequestParam String userName) {
        List<Member> members = stableBService.findEmployeesByName(userName);
        System.out.println(members);
        System.out.println("userName: " + userName);

        members.forEach(emp -> System.out.println("직원: " + emp));



        if (members.isEmpty()) {
            return ResponseEntity.ok(Collections.emptyList());
        }

        return ResponseEntity.ok(members);

    }

}





