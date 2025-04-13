package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

public interface SpecificationBService {
    Model salaryList(Integer cpage, Model model, String search, HttpSession session) throws Exception;

    Model salaryDetail(Model model, Long userNo, HttpSession session) throws Exception;

    void payment(Model model,Long userNo, Integer deduction, HttpSession session) throws Exception;

    Model monthlyFee(Model model, HttpSession session) throws Exception;

    void updateMoney(HttpSession session, Model model, Integer money) throws Exception;
}
