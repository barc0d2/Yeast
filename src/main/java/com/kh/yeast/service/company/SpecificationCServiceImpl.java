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
    public Integer selectEmployeeCount() {
        return specificationCMapper.selectEmployeeCount();
    }

    @Override
    public ArrayList<Member> getEmployeeList(PageInfo pi) {
        Integer offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        ArrayList<Member> list = specificationCMapper.selectEmployeeList(rowBounds);
        list.forEach(employee -> {
            Timestamp createDate = employee.getCreateDate();
            if (createDate != null) {
                Date sqlDate = new Date(createDate.getTime());
                employee.setEnrollDate(sqlDate);
            } else {
                employee.setEnrollDate(null);
            }
        });
        return list;
    }

    @Override
    public List<Member> findEmployeesByName(String userName) {
        List<Member> employees = specificationCMapper.findEmployeesByName(userName);
        for (Member employee : employees) {
            if (employee.getHeadName() == null) {
                employee.setHeadName("없음");
            }
            if (employee.getStatus() != null) {
            }
        }
        return employees;
    }

    @Override
    public Member findByUserNo(Long userNo) {
        return specificationCMapper.findByUserNo(userNo);
    }

    @Override
    public Member findByBusinessNo(Long businessNo) {
        return specificationCMapper.findByBusinessNo(businessNo);
    }

    @Override
    public Model detail(Model model, Long businessNo) {
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
