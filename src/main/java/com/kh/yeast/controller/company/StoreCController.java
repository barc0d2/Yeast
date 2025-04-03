package com.kh.yeast.controller.company;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.service.company.StoreCService;
import com.kh.yeast.utils.Template;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.eclipse.tags.shaded.org.apache.bcel.generic.ARETURN;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class StoreCController {

    private final StoreCService storeCService;

    @GetMapping("/company/store/enrollForm")
    public String enrollFormStore(Model model) {
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName","지점추가");
        return "company/store/enrollForm";
    }

    @GetMapping("/company/store/list")
    public String listStore(@RequestParam(defaultValue = "1") int cpage, Model model) {
        int listCount = storeCService.selectStoreCount();

        PageInfo pi = new PageInfo(listCount, cpage, 10, 6);
        ArrayList<Business> list = storeCService.selectStoreList(pi);
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName", "지점수정/추가");
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "company/store/list";
    }

    @GetMapping("/company/store/updateForm")
    public String updateFormStore(int businessNo, Model model) {
        Business business = storeCService.selectStore(businessNo);
        System.out.println(business.getBusinessNo());
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName", "지점수정");
        model.addAttribute("business", business);
        return "company/store/updateForm";
    }

    @PostMapping("/company/store/updateThings")
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
            result = storeCService.updateThings(business);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("currentName", "지점관리");
        model.addAttribute("smallCurrentName","지점수정");
        if(result > 0){
            session.setAttribute("alertMsg", "지점 수정 성공");
            return "redirect:/company/store/updateForm?businessNo=" + business.getBusinessNo();
        } else {
            model.addAttribute("errorMsg", "지점 수정 실패");
            return "common/errorPage";
        }
    }

    @GetMapping("/company/store/delete")
    public String deleteStore(int businessNo,  HttpSession session, Model model) {
            int result = storeCService.deleteStore(businessNo);
      if(result > 0){
          session.setAttribute("alertMsg", "지점 삭제 성공");
          return "redirect:/company/store/list";
      } else{
          model.addAttribute("errorMsg","지점 삭제 실패");
          return "common/errorPage";
      }
    }

    @PostMapping("/company/store/insertStore")
    public String insertStore(@ModelAttribute Business business, MultipartFile upfile,HttpSession session, Model model) {
        if(!upfile.getOriginalFilename().equals("")){
            String changeName = Template.saveFile(upfile, session, "/resources/uploadfile/");
            business.setImageChange("/resources/uploadfile/" + changeName);
            business.setImageOrigin(upfile.getOriginalFilename());
        }

        Integer result = null;
        try {
            result = storeCService.insertStore(business);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if (result > 0) {
            session.setAttribute("alertMsg", "지점 추가 성공");
            return "redirect:/company/store/list";
        } else {
            model.addAttribute("errorMsg", "지점 추가 실패");
            return "common/errorPage";
        }
    }
}
