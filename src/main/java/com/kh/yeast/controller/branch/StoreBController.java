package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.service.branch.StoreBService;
import com.kh.yeast.service.company.StoreCService;
import com.kh.yeast.utils.Template;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
@RequestMapping("/branch/store")
public class StoreBController {

    private final StoreBService storeBService;

    @GetMapping("/updateForm")
    public String updateFormStore(int businessNo, Model model) {
        Business business = storeBService.selectStore(businessNo);
        System.out.println(business.getBusinessNo());
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName", "지점수정");
        model.addAttribute("business", business);
        return "branch/store/updateForm";
    }

    @PostMapping("/updateThings")
    public String updateThings(@ModelAttribute Business business, MultipartFile reupfile, HttpSession session, Model model) {
        System.out.println("Received BUSINESS_NO: " + business.getBusinessNo());
        System.out.println("변환된 파일 경로: " + session.getServletContext().getRealPath(business.getImageChange()));
        if(!reupfile.getOriginalFilename().equals("")){
            if(business.getImageChange() != null && !business.getImageChange().equals("")){
                new File(session.getServletContext().getRealPath(business.getImageChange())).delete();
            }

            String changeName = Template.saveFile(reupfile, session, "/resources/uploadfile/");
            business.setImageChange("/resources/uploadfile/" + changeName);
            business.setImageOrigin(reupfile.getOriginalFilename());
        }
        int result = 0;
        try {
            result = storeBService.updateThings(business);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName","지점수정");
        if(result > 0){
            session.setAttribute("alertMsg", "지점 수정 성공");
            return "redirect:/branch/store/updateForm?businessNo=" + business.getBusinessNo();
        } else {
            model.addAttribute("errorMsg", "지점 수정 실패");
            return "errorPage";
        }
    }

}
