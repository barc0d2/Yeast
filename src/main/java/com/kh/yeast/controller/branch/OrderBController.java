package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.dto.SupplyOrderRequest;
import com.kh.yeast.domain.vo.*;
import com.kh.yeast.service.branch.OrderBService;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@RequestMapping("/branch/order")
@Controller
public class OrderBController {

    private final OrderBService orderBService;

    @GetMapping("/list")
    public String orderManagement(@RequestParam(defaultValue = "1") int currentPage, Model model){
        model.addAttribute("currentName", "발주신청");
        model.addAttribute("smallCurrentName","발주신청내역");

        int orderCount = orderBService.selectOrderCount();

        PageInfo pi = new PageInfo(orderCount, currentPage, 10, 10);
        ArrayList<Supply> list = orderBService.selectOrderList(pi);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "branch/order/list";
    }

    @GetMapping("/orderPage")
    public String orderPage(Model model){
        model.addAttribute("currentName", "발주신청");
        model.addAttribute("smallCurrentName","발주신청");
        ArrayList<Supply> list = orderBService.selectValue();
        System.out.println(list);
        model.addAttribute("list", list);

        List<String> categoryList = list.stream()
                .map(Supply::getCategoryName)
                .distinct()
                .collect(Collectors.toList());

        model.addAttribute("categoryList", categoryList);

        return "branch/order/orderPage";
    }


    @PostMapping("/insertList")
    public String insertList(@RequestParam("category") ArrayList<String> category,
                             @RequestParam("breadName") ArrayList<String> bread,
                             @RequestParam("quantity") ArrayList<Integer> quantity,
                             @RequestParam("price") ArrayList<Integer> price,HttpSession session, Model model) {
        int result =0;
        for (int i = 0; i < bread.size(); i++) {
            String categoryName = category.get(i);
            String breadName = bread.get(i);
            String quantityList = quantity.get(i).toString();
            String priceList = price.get(i).toString();

            System.out.println("빵 종류 : " + categoryName);
            System.out.println("빵 이름 : " + breadName);
            System.out.println("개수 : " + quantityList);
            System.out.println("구매가격 : " + priceList);

            result += orderBService.insertList(categoryName,breadName,quantityList,priceList);
        }
        if(result == bread.size()){
           session.setAttribute("alertMsg","발주 신청 완료");
           return "redirect:/branch/order/list";
        }else{
            model.addAttribute("errorMsg", "발주 신청 실패");
            return "error";
        }
    }
}
