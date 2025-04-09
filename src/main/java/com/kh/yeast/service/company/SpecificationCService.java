package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

public interface SpecificationCService {
    Model specificationList(Integer cpage, Model model, String search) throws Exception;

    Model detail(Model model, Long userNo) throws Exception;

    Model monthlyFee(Model model, Long businessNo);
}
