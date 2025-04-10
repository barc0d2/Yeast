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
        System.out.println("monthSellMoney = " + monthSellMoney);
        Integer status = specificationBMapper.lastMonthStatus(businessNo);
        model.addAttribute("status", status);
        System.out.println("status = " + status);
        RowBounds rowBounds = new RowBounds(1, Integer.MAX_VALUE);
        ArrayList<Business> businessList = specificationBMapper.selectBusinessList(rowBounds);
        model.addAttribute("businessList", businessList);
        System.out.println("businessList = " + businessList);
        if(member==null || status == null){
            throw new NullPointerException();
        }

        return model;
    }

    @Override
    @Transactional
    public synchronized void updateMoney(HttpSession session, Model model, Integer money) {

        Member member = (Member) session.getAttribute("loginUser");
        Long businessNo = member.getBusinessNo();

        Integer updatedAdd = specificationBMapper.updateAddMoney(1L, money);
        if(updatedAdd==0 || updatedAdd==null){
            throw new PaymentTransactionException("회사에 수수료를 지불하지 못했습니다.");
        }

        Integer updateSub = specificationBMapper.updateSubMoney(businessNo, money);
        if(updateSub==0 || updateSub==null){
            throw new PaymentTransactionException("가맹점에서 수수료가 차감되지 않았습니다.");
        }

        Integer updateSellMonthly = specificationBMapper.updateSellMonthly(businessNo);
        if(updateSellMonthly==0 || updateSellMonthly==null){
            throw new PaymentTransactionException("결제 내역이 업데이트 안되었습니다.");
        }

        Integer updateRemitted = specificationBMapper.updateRemitted(businessNo);
        if(updateRemitted==0 || updateRemitted==null){
            throw new PaymentTransactionException("날짜가 갱신되지 않았습니다.");
        }
    }
}
