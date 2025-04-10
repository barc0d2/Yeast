package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

public interface SpecificationBService {
    Model detail(Model model, HttpSession session) throws Exception;

    void updateMoney(HttpSession session, Model model, Integer money) throws Exception;
}
