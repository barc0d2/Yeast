package com.kh.yeast.service.company;

import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;

public interface SpecificationCService {
    Model salaryList(Integer cpage, Model model, String search, HttpSession session) throws Exception;

    Model salaryDetail(Model model, Long userNo) throws Exception;

    void payment(Model model,Long userNo, Integer deduction) throws Exception;

    Model monthlyFeeDetail(Model model, Long businessNo);
}
