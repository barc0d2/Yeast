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
    public String enrollFormBread(Model model) {
        ArrayList<BreadCategory> categories;
        try {
            categories = breadCService.selectBreadCategories();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("currentName", "메뉴관리");
        model.addAttribute("smallCurrentName","메뉴등록");
        model.addAttribute("categories",categories);
        return "company/bread/enrollForm";
    }

    @GetMapping("/company/bread/updateForm")
    public String updateFormBread(int breadNo, Model model) {
        ArrayList<BreadCategory> categories;
        Bread bread = null;
        try {
            categories = breadCService.selectBreadCategories();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        try {
            bread = breadCService.selectBread(breadNo);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("bread",bread);
        model.addAttribute("categories",categories);
        model.addAttribute("currentName", "메뉴관리");
        model.addAttribute("smallCurrentName","메뉴수정");
        return "company/bread/updateForm";
    }

    @GetMapping("/company/bread/detail")
    public String detailBread(int breadNo, Model model) {
        Bread bread = null;
        try {
            bread = breadCService.selectBread(breadNo);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("currentName", "메뉴관리");
        model.addAttribute("smallCurrentName","메뉴조회");
        model.addAttribute("bread",bread);
        return "company/bread/detail";
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
        model.addAttribute("currentName", "메뉴관리");
        model.addAttribute("smallCurrentName","메뉴조회");

        return "company/bread/list";
    }

    @PostMapping("/company/bread/insert")
    public String insertBread(@ModelAttribute Bread bread, MultipartFile upfile, HttpSession session, Model model) {
        if(bread.getStatus() == null) {
            bread.setStatus(0);
        }
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
        model.addAttribute("currentName", "메뉴관리");
        model.addAttribute("smallCurrentName","메뉴조회");
        if (result > 0) {
            session.setAttribute("alertMsg", "게시글 작성 성공");
            return "redirect:/company/bread/list";
        } else {
            model.addAttribute("errorMsg", "게시글 작성 실패");
            return "common/errorPage";
        }
    }

    @PostMapping("/company/bread/update")
    public String updateBread(@ModelAttribute Bread bread, MultipartFile reupfile, HttpSession session, Model model) {
        if(bread.getStatus() == null) {
            bread.setStatus(0);
        }
        System.out.println("변환된 파일 경로: " + session.getServletContext().getRealPath(bread.getImageChange()));
        if(!reupfile.getOriginalFilename().equals("")){
            if(bread.getImageChange() != null && !bread.getImageChange().equals("")){
                new File(session.getServletContext().getRealPath(bread.getImageChange())).delete();
            }

            String changeName = Template.saveFile(reupfile, session, "/resources/uploadfile/");
            bread.setImageChange("/resources/uploadfile/" + changeName);
            bread.setImageOrigin(reupfile.getOriginalFilename());
        }
        System.out.println("bread : "+bread.getImageChange());
        int result = 0;
        try {
            result = breadCService.updateBread(bread);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("currentName", "메뉴관리");
        model.addAttribute("smallCurrentName","메뉴조회");
        if(result > 0){
            session.setAttribute("alertMsg", "게시글 수정 성공");
            return "redirect:/company/bread/detail?breadNo=" + bread.getBreadNo();
        } else {
            model.addAttribute("errorMsg", "게시글 수정 실패");
            return "common/errorPage";
        }
    }

    @PostMapping("/company/bread/delete")
    public String deleteBread(@ModelAttribute Bread bread, HttpSession session, Model model) {
        String imageChange = bread.getImageChange();
        Long breadNo = bread.getBreadNo();
        System.out.println("변환된 파일 경로: " + session.getServletContext().getRealPath(bread.getImageChange()));
        if(imageChange != null && !imageChange.equals("")){
            new File(session.getServletContext().getRealPath(imageChange)).delete();
        }
        Integer result;
        try {
            result = breadCService.deleteBread(breadNo);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("currentName", "메뉴관리");
        model.addAttribute("smallCurrentName","메뉴조회");
        if(result > 0){
            session.setAttribute("alertMsg", "게시글 삭제 성공");
            return "redirect:/company/bread/list";
        } else {
            model.addAttribute("errorMsg", "게시글 삭제 실패");
            return "common/errorPage";
        }
    }
}