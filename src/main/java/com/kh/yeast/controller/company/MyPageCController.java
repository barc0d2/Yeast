package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.service.company.MyPageCService;
import com.kh.yeast.utils.Template;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.parameters.P;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

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

    @GetMapping("mypage/updatePwdForm")
    public String updatePwdForm(Model model) {
        model.addAttribute("currentName", "마이페이지");
        model.addAttribute("smallCurrentName","비밀번호 변경");
        return "company/mypage/updatePwdForm";
    }

    @PostMapping("updatePwd")
    public String updatePwd(@SessionAttribute("loginUser") Member loginUser,
                            @RequestParam("currentPwd") String currentPwd,
                            @RequestParam("newPwd") String newPwd,
                            @RequestParam("confirmPwd") String confirmPwd,
                            HttpSession session,
                            Model model) {

        if (!bCryptPasswordEncoder.matches(currentPwd, loginUser.getUserPwd())) {
            session.setAttribute("alertMsg", "현재 비밀번호가 일치하지 않습니다.");
            return "redirect:/company/mypage/updatePwdForm";
        }

        if (!newPwd.equals(confirmPwd)) {
            session.setAttribute("alertMsg", "새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return "redirect:/company/mypage/updatePwdForm";
        }
        long userNo = loginUser.getUserNo();
        String pwd = bCryptPasswordEncoder.encode(newPwd);
        int result =  myPageCService.updatePwd(userNo, pwd);
        if(result > 0){
            session.setAttribute("alertMsg", "비밀번호가 성공적으로 변경되었습니다.");
            return "redirect:/company/mypage/myPage";
        } else{
            session.setAttribute("alertMsg", "비밀번호 변경을 실패하였습니다.");
            return "redirect:/company/mypage/myPage";
        }

    }


}
