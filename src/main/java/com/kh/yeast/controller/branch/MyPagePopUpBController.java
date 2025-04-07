package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.entity.Member;
import com.kh.yeast.service.branch.MyPagePopUpBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

    @Controller
    @RequestMapping("/branch/storemangement/specification/myPagePopUp")
    public class MyPagePopUpBController {

        private final MyPagePopUpBService myPagePopUpBService;

        @Autowired
        public MyPagePopUpBController(MyPagePopUpBService myPagePopUpBService) {
            this.myPagePopUpBService = myPagePopUpBService;
        }

        @PostMapping("/myPagePopUp")
        @ResponseBody
        public ResponseEntity<?> updateUser(@RequestBody Member member) {
            try {
                boolean success = myPagePopUpBService.updateBMemberInfo(member);
                return ResponseEntity.ok("{\"success\": " + success + "}");
            } catch (Exception e) {
                e.printStackTrace();
                return ResponseEntity.status(500).body("{\"success\": false}");
            }
        }
    }

