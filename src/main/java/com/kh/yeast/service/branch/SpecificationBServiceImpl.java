package com.kh.yeast.service.branch;

import com.kh.yeast.customException.PaymentTransactionException;
import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.mappers.branch.SpecificationBMapper;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.sql.Timestamp;
import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class SpecificationBServiceImpl implements SpecificationBService {

    private final SpecificationBMapper specificationBMapper;

    @Override
    public Model detail(Model model, HttpSession session) {

        Member member = (Member) session.getAttribute("loginUser");
        Long businessNo = member.getBusinessNo();

        Integer monthSellMoney = specificationBMapper.selectMonthlySellMoney(businessNo);
        model.addAttribute("monthSellMoney", monthSellMoney);

        Integer status = specificationBMapper.lastMonthStatus(businessNo);
        model.addAttribute("status", status);

        RowBounds rowBounds = new RowBounds(1, Integer.MAX_VALUE);
        ArrayList<Business> businessList = specificationBMapper.selectBusinessList(rowBounds);
        model.addAttribute("businessList", businessList);

        if(member==null || status == null || monthSellMoney==null){
            model.addAttribute("errorMsg", "페이지를 불러오지 못했습니다");
        }

        return model;
    }

    @Override
    @Transactional
    public Model updateMoney(HttpSession session, Model model, Integer money) {

        Member member = (Member) session.getAttribute("loginUser");
        Long businessNo = member.getBusinessNo();

        Integer monthSellMoney = specificationBMapper.selectMonthlySellMoney(businessNo);
        model.addAttribute("monthSellMoney", monthSellMoney);

        Integer status = specificationBMapper.lastMonthStatus(businessNo);
        model.addAttribute("status", status);

        RowBounds rowBounds = new RowBounds(1, Integer.MAX_VALUE);
        ArrayList<Business> businessList = specificationBMapper.selectBusinessList(rowBounds);
        model.addAttribute("businessList", businessList);

        Timestamp branchUpdateAt = specificationBMapper.selectUpdateAt(businessNo);
        Timestamp companyUpdateAt = specificationBMapper.selectUpdateAt(1L);

        Integer result1 = specificationBMapper.updateAddMoney(1L, money, companyUpdateAt);
        if(result1==0 || result1==null){
            throw new PaymentTransactionException("회사에 수수료를 지불하지 못했습니다.");
        }

        Integer result2 = specificationBMapper.updateSubMoney(businessNo, money, branchUpdateAt);
        if(result2==0 || result2==null){
            throw new PaymentTransactionException("가맹점에서 수수료가 차감되지 않았습니다.");
        }

        return model;
    }
}
