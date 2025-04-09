package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.service.company.EmployeeCService;
import com.kh.yeast.utils.Template;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
@RequestMapping("/company/employee")
public class EmployeeCController {

    private final EmployeeCService employeeCService;


    @GetMapping("/enrollForm")
    public String enrollFormEmployee(int userNo, Model model) throws Exception  {
        Member member = employeeCService.selectMember(userNo);
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName","직원수정");
        model.addAttribute("member", member);
        return "company/employee/enrollForm";
    }

    @GetMapping("/list")
    public String listEmployee(@RequestParam(defaultValue = "1") int currentPage, Model model) throws Exception  {
        int memberCount = employeeCService.selectMemberCount();

        PageInfo pi = new PageInfo(memberCount, currentPage, 10, 10);
        ArrayList<Member> list = employeeCService.selectMemberList(pi);
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName","직원관리");
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "company/employee/list";
    }

    @PostMapping("/update")
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
            result = employeeCService.update(member);
            System.out.println("result = "+result);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName","지점수정");
        if(result > 0){
            session.setAttribute("alertMsg", "지점 수정 성공");
            return "redirect:/company/employee/enrollForm?userNo=" + member.getUserNo();
        } else {
            model.addAttribute("errorMsg", "지점 수정 실패");
            return "common/errorPage";
        }
    }



}
