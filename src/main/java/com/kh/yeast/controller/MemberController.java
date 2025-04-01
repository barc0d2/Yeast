package com.kh.yeast.controller;

import com.kh.yeast.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/agreement")
    public String showAgreement() {
        log.info("약관 동의 페이지 요청");
        return "register/agreement";
    }

    @GetMapping("/register")
    public String showRegisterForm() {
        log.info("회원가입 페이지 요청");
        return "register/register";
    }

    @GetMapping("/check-id")
    @ResponseBody
    public ResponseEntity<?> checkUserId(@RequestParam String userId) {
        log.info("아이디 중복 체크 요청: {}", userId);
        Map<String, Object> response = new HashMap<>();

        try {
            if (userId == null || userId.trim().isEmpty()) {
                response.put("available", false);
                response.put("message", "아이디를 입력해주세요.");
                return ResponseEntity.badRequest().body(response);
            }

            boolean isAvailable = memberService.isUserIdAvailable(userId);
            response.put("available", isAvailable);
            response.put("message", isAvailable ? "사용 가능한 아이디입니다." : "이미 사용 중인 아이디입니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            log.error("아이디 중복 체크 중 오류 발생", e);
            response.put("available", false);
            response.put("message", "아이디 중복 체크 중 오류가 발생했습니다.");
            return ResponseEntity.internalServerError().body(response);
        }
    }

    @PostMapping("/register")
    @ResponseBody
    public ResponseEntity<?> registerMember(
            @RequestParam(required = true) String gender,
            @RequestParam(required = true) String positionName,
            @RequestParam(required = true) String businessName,
            @RequestParam(required = true) String managerName,
            @RequestParam(required = true) String userName,
            @RequestParam(required = true) String userId,
            @RequestParam(required = true) String userPwd,
            @RequestParam(required = true) String email,
            @RequestParam(required = true) String birthday,
            @RequestParam(required = true) String phone,
            @RequestParam(required = true) String address,
            @RequestParam(required = false) MultipartFile profileImage) {

        log.info("회원가입 요청: userId={}, userName={}", userId, userName);
        Map<String, Object> response = new HashMap<>();

        try {
            // 입력값 검증
            if (userId == null || userId.trim().isEmpty() || userId.length() < 4) {
                response.put("success", false);
                response.put("message", "아이디는 4자 이상이어야 합니다.");
                return ResponseEntity.badRequest().body(response);
            }

            if (userPwd == null || userPwd.trim().isEmpty() || userPwd.length() < 8) {
                response.put("success", false);
                response.put("message", "비밀번호는 8자 이상이어야 합니다.");
                return ResponseEntity.badRequest().body(response);
            }

            if (email == null || email.trim().isEmpty() || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                response.put("success", false);
                response.put("message", "올바른 이메일 형식이 아닙니다.");
                return ResponseEntity.badRequest().body(response);
            }

            if (phone == null || phone.trim().isEmpty() || !phone.matches("^\\d{2,3}-\\d{3,4}-\\d{4}$")) {
                response.put("success", false);
                response.put("message", "올바른 전화번호 형식이 아닙니다.");
                return ResponseEntity.badRequest().body(response);
            }

            // 아이디 중복 체크
            if (!memberService.isUserIdAvailable(userId)) {
                response.put("success", false);
                response.put("message", "이미 사용 중인 아이디입니다.");
                return ResponseEntity.badRequest().body(response);
            }

            // 프로필 이미지 크기 검증
            if (profileImage != null && !profileImage.isEmpty()) {
                if (profileImage.getSize() > 5 * 1024 * 1024) { // 5MB 제한
                    response.put("success", false);
                    response.put("message", "프로필 이미지는 5MB 이하여야 합니다.");
                    return ResponseEntity.badRequest().body(response);
                }
            }

            memberService.registerMember(
                    gender, positionName, businessName, managerName,
                    userName, userId, userPwd, email, birthday, phone, address, profileImage
            );

            response.put("success", true);
            response.put("message", "회원가입이 완료되었습니다.");
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            log.error("회원가입 중 오류 발생", e);
            response.put("success", false);
            response.put("message", "회원가입 중 오류가 발생했습니다.");
            return ResponseEntity.internalServerError().body(response);
        }
    }
}