package com.kh.yeast.controller.company;


import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.BreadCategory;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.service.company.BreadCService;
import com.kh.yeast.utils.Template;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class BreadCController {

    private final BreadCService breadCService;

    @GetMapping("/company/bread/enrollForm")
    public String enrollFormProduct(Model model) {
        ArrayList<BreadCategory> categories;
        try {
            categories = breadCService.selectBreadCategories();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        System.out.println("size"+categories.size());
        model.addAttribute("categories",categories);
        return "company/bread/enrollForm";
    }

    @GetMapping("/company/bread/updateForm")
    public String updateFormBread() {
        return "company/bread/updateForm";
    }

    @GetMapping("/company/bread/list")
    public String selectBreadList(@RequestParam(defaultValue = "1") Integer currentPage, Model model) {
        Integer breadCount = null;
        try {
            breadCount = breadCService.selectBreadCount();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        PageInfo pi = new PageInfo(breadCount, currentPage, 10, 6);
        ArrayList<Bread> list = null;
        try {
            list = breadCService.selectBreadList(pi);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        System.out.println("size1"+list.size());

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "company/bread/list";
    }

    @PostMapping("/company/bread/insert")
    public String insertBread(@ModelAttribute Bread bread, MultipartFile upfile, HttpSession session, Model model) {
        if(!upfile.getOriginalFilename().equals("")){
            String changeName = Template.saveFile(upfile, session, "/resources/uploadfile/");
            bread.setImageChange("/resources/uploadfile/" + changeName);
            bread.setImageOrigin(upfile.getOriginalFilename());
        }

        Integer result = null;
        try {
            result = breadCService.insertBread(bread);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if (result > 0) {
            session.setAttribute("alertMsg", "게시글 작성 성공");
            return "redirect:/list.bo";
        } else {
            model.addAttribute("errorMsg", "게시글 작성 실패");
            return "common/errorPage";
        }
    }

    @PostMapping("/company/bread/update")
    public String updateBread(@ModelAttribute Bread bread, MultipartFile reupfile, HttpSession session, Model model) {
        if(!reupfile.getOriginalFilename().equals("")){
            if(bread.getImageChange() != null && !bread.getImageChange().equals("")){
                new File(session.getServletContext().getRealPath(bread.getImageChange())).delete();
            }

            String changeName = Template.saveFile(reupfile, session, "/resources/uploadfile/");
            bread.setImageChange("/resources/uploadfile/" + changeName);
            bread.setImageOrigin(reupfile.getOriginalFilename());
        }

        int result = 0;
        try {
            result = breadCService.updateBread(bread);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if(result > 0){
            session.setAttribute("alertMsg", "게시글 수정 성공");
            return "redirect:/detail.bo?bno=" + bread.getBreadNo();
        } else {
            model.addAttribute("errorMsg", "게시글 수정 실패");
            return "common/errorPage";
        }
    }
}