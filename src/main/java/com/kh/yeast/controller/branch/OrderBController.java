package com.kh.yeast.controller.branch;

import com.kh.yeast.domain.vo.*;
import com.kh.yeast.service.branch.OrderBService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@RequestMapping("/branch/order")
@Controller
public class OrderBController {

    private final OrderBService orderBService;

    @GetMapping("/list")
    public String orderManagement(@SessionAttribute("loginUser") Member loginUser ,@RequestParam(defaultValue = "1") int currentPage, Model model){
        model.addAttribute("currentName", "발주신청");
        model.addAttribute("smallCurrentName","발주신청내역");
        long businessNo = loginUser.getBusinessNo();
        int orderCount = orderBService.selectOrderCount(businessNo);

        PageInfo pi = new PageInfo(orderCount, currentPage, 10, 10);
        ArrayList<Supply> list = orderBService.selectOrderList(businessNo, pi);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "branch/order/list";
    }

    @GetMapping("/orderPage")
    public String orderPage(@SessionAttribute("loginUser") Member loginUser, Model model){
        model.addAttribute("currentName", "발주신청");
        model.addAttribute("smallCurrentName","발주신청");
        long businessNo = loginUser.getBusinessNo();
        ArrayList<Supply> list = orderBService.selectValue();
        int money = orderBService.businessMoney(businessNo);
        System.out.println(list);
        model.addAttribute("money", money);
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
                             @RequestParam("price") ArrayList<Integer> price,HttpSession session,
                             @RequestParam("totalSumPrice") int totalSumPrice,
                             @SessionAttribute("loginUser") Member loginUser,Model model) {
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
        long businessNo = loginUser.getBusinessNo();
        int result2 = orderBService.updateBusinessMoney(businessNo, totalSumPrice);
        if(result == bread.size()){
           session.setAttribute("alertMsg","발주 신청 완료");
           return "redirect:/branch/order/list";
        }else{
            model.addAttribute("errorMsg", "발주 신청 실패");
            return "error";
        }
    }

    @GetMapping("/deleteOrder")
    public String updateForm(@SessionAttribute("loginUser") Member loginUser, int supplyNo, Model model){
        ArrayList<Supply> supply = orderBService.selectUpdate(supplyNo);
        Supply list = orderBService.selectUpdateInfo(supplyNo);
        ArrayList<Supply> bread = orderBService.selectValue();
        model.addAttribute("currentName", "발주관리");
        model.addAttribute("smallCurrentName","발주정보");
        long businessNo = loginUser.getBusinessNo();
        int money = orderBService.businessMoney(businessNo);
        model.addAttribute("money", money);
        model.addAttribute("supply", supply);
        model.addAttribute("list", list);
        model.addAttribute("bread", bread);

        return "branch/order/deleteOrder";
    }

    @PostMapping("/deleteOrderON")
    public String updateList(@RequestParam("supplyNo") long supplyNo ,@SessionAttribute("loginUser") Member loginUser, @RequestParam("totalPrice") long totalPrice, HttpSession session, Model model) {
        long businessNo = loginUser.getBusinessNo();
            int result1 = orderBService.deleteList(supplyNo);
            int result2 = orderBService.updateMoney(businessNo,totalPrice);
        if(result1 * result2 != 0){
            session.setAttribute("alertMsg","발주삭제 완료");
            return "redirect:/branch/order/list";
        }else{
            model.addAttribute("errorMsg", "발주삭제 실패");
            return "error";
        }
    }

}
