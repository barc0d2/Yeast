package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.service.company.MyPageCService;
import com.kh.yeast.utils.Template;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Controller
@RequiredArgsConstructor
@RequestMapping("/company")
public class MyPageCController {

    private final MyPageCService myPageCService;

    @GetMapping("mypage/myPage")
    public String showCMyPage(@SessionAttribute("loginUser")Member loginUser , Model model) throws Exception {
        Long userNo = loginUser.getUserNo();
        Member member = myPageCService.selectMember(userNo);
        model.addAttribute("currentName", "마이페이지");
        model.addAttribute("smallCurrentName","마이페이지");
        model.addAttribute("positions", myPageCService.getAllPositions());
        model.addAttribute("businesses", myPageCService.getAllBusinesses());
        model.addAttribute("member", member);
        return "company/mypage/myPage";
    }

    @PostMapping("mypage/update")
    public String update(@ModelAttribute Member member, MultipartFile reupfile, HttpSession session, Model model) {
        if(!reupfile.getOriginalFilename().equals("")){
            if(member.getImageChange() != null && !member.getImageChange().equals("")){
                new File(session.getServletContext().getRealPath(member.getImageChange())).delete();
            }

            String changeName = Template.saveFile(reupfile, session, "/resources/uploadfile/");
            member.setImageChange("/resources/uploadfile/" + changeName);
            member.setImageOrigin(reupfile.getOriginalFilename());
        }
        int result = 0;
        Member loginUpdate;
        try {
            result = myPageCService.update(member);
            loginUpdate = myPageCService.selectMember(member.getUserNo());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        session.setAttribute("loginUser", loginUpdate);
        model.addAttribute("currentName", "마이페이지");
        model.addAttribute("smallCurrentName","마이페이지");
        if(result > 0){
            session.setAttribute("alertMsg", "마이페이지 정보수정 성공");
            return "redirect:/company/mypage/myPage";
        } else {
            model.addAttribute("errorMsg", "마이페이지 정보수정 실패");
            return "errorPage";
        }
    }

}
