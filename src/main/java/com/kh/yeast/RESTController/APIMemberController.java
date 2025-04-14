package com.kh.yeast.RESTController;

import com.kh.yeast.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/member")
public class APIMemberController {

    private final MemberService memberService;

    @PostMapping("/delete")
    @ResponseBody
    public String delete(HttpServletRequest request, HttpServletResponse response) {
        long userNo = Long.parseLong(request.getParameter("userNo"));
        int result = memberService.delete(userNo);
        return result == 1 ? "YES" : "NO";
    }

}
