package com.kh.yeast.service.company;

import org.springframework.ui.Model;

public interface SpecificationCService {
    Model specificationList(Integer cpage, Model model, String search) throws Exception;

    Model detail(Model model, Long userNo) throws Exception;

    void payment(Model model,Long userNo, Integer deduction) throws Exception;

    Model monthlyFee(Model model, Long businessNo);
}
