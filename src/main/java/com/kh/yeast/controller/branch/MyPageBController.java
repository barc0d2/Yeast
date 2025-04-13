package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.service.branch.MyPageBService;
import com.kh.yeast.utils.Template;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@RequiredArgsConstructor
@Controller
@RequestMapping("/branch")
public class MyPageBController {

    private final MyPageBService myPageBService;


    @GetMapping("mypage/myPage")
    public String showCMyPage(@SessionAttribute("loginUser") Member loginUser , Model model) throws Exception {
        Long userNo = loginUser.getUserNo();
        Member member = myPageBService.selectMember(userNo);
        model.addAttribute("currentName", "마이페이지");
        model.addAttribute("smallCurrentName","마이페이지");
        model.addAttribute("member", member);
        return "branch/mypage/myPage";
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
        try {
            System.out.println(member.getImageChange());
            System.out.println(member.getImageOrigin());
            System.out.println(member.getUserNo());
            result = myPageBService.update(member);
            System.out.println("result = "+result);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("currentName", "마이페이지");
        model.addAttribute("smallCurrentName","마이페이지");
        if(result > 0){
            session.setAttribute("alertMsg", "마이페이지 정보수정 성공");
            return "branch/mypage/myPage";
        } else {
            model.addAttribute("errorMsg", "마이페이지 정보수정 실패");
            return "common/errorPage";
        }
    }
}
