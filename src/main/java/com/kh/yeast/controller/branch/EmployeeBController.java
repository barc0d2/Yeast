package com.kh.yeast.controller.branch;


import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.service.branch.EmployeeBService;
import com.kh.yeast.utils.Template;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;

@Controller
@RequiredArgsConstructor
@RequestMapping("/branch")
public class  EmployeeBController {

    private final EmployeeBService employeeBService;

    @GetMapping("/employee/enrollForm")
    public String enrollFormEmployee(int userNo, Model model) {
        Member member = employeeBService.selectMember(userNo);
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName","직원수정");
        model.addAttribute("member", member);
        return "branch/employee/enrollForm";
    }

    @GetMapping("/employee/list")
    public String listEmployee(@SessionAttribute("loginUser") Member loginUser, @RequestParam(defaultValue = "1") int currentPage, Model model) {
        long businessNo = loginUser.getBusinessNo();
        int memberCount = employeeBService.selectMemberCount(businessNo);

        PageInfo pi = new PageInfo(memberCount, currentPage, 10, 10);
        ArrayList<Member> list = employeeBService.selectMemberList(businessNo,pi);
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName","직원관리");
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "branch/employee/list";
    }

    @PostMapping("/employee/update")
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
            result = employeeBService.update(member);
            System.out.println("result = "+result);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName","지점수정");
        if(result > 0){
            session.setAttribute("alertMsg", "지점 수정 성공");
            return "redirect:/branch/employee/enrollForm?userNo=" + member.getUserNo();
        } else {
            model.addAttribute("errorMsg", "지점 수정 실패");
            return "common/errorPage";
        }
    }

    @GetMapping("/introduction/allEmployeeList")
    public String listBEmployee(@RequestParam(defaultValue = "1") int currentPage, Model model) throws Exception  {
        int memberCount = employeeBService.selectAllMemberCount();

        PageInfo pi = new PageInfo(memberCount, currentPage, 10, 10);
        ArrayList<Member> list = employeeBService.selectAllMemberList(pi);
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName","직원관리");
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "branch/introduction/allEmployeeList";
    }


}