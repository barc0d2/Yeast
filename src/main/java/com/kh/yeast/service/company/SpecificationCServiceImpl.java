package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.company.SpecificationCMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class SpecificationCServiceImpl implements SpecificationCService{

    private final SpecificationCMapper specificationCMapper;

    @Override
    public Model specificationList(Integer cpage, Model model, String search) {
        Integer employeeCount = specificationCMapper.selectEmployeeCount();

        PageInfo pi = new PageInfo(employeeCount, cpage, 10, 10);
        Integer offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        ArrayList<Member> list = specificationCMapper.selectEmployeeList(rowBounds, search);

        list.forEach(member -> {
            Timestamp createDate = member.getCreateDate();
            if (createDate != null) {
                Date sqlDate = new Date(createDate.getTime());
                member.setEnrollDate(sqlDate);
            } else {
                member.setEnrollDate(null);
            }
        });

        model.addAttribute("employees", list);
        return model;
    }

    @Override
    public Model detail(Model model, Long userNo) throws Exception {

        return model;
    }

    @Override
    public Model monthlyFee(Model model, Long businessNo) {
        Member member = specificationCMapper.findByBusinessNo(businessNo);
        model.addAttribute("member", member);

        Integer monthSellMoney = specificationCMapper.selectMonthlySellMoney(businessNo);
        model.addAttribute("monthSellMoney", monthSellMoney);

        Integer status = specificationCMapper.lastMonthStatus(businessNo);
        model.addAttribute("status", status);

        RowBounds rowBounds = new RowBounds(1, Integer.MAX_VALUE);
        ArrayList<Business> businessList = specificationCMapper.selectBusinessList(rowBounds);
        model.addAttribute("businessList", businessList);

        if(member==null || status == null || monthSellMoney==null){
            model.addAttribute("errorMsg", "페이지를 불러오지 못했습니다");
        }

        return model;
    }
}
