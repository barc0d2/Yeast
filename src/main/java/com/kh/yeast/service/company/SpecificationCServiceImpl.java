package com.kh.yeast.service.company;

import com.kh.yeast.customException.PaymentTransactionException;
import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.company.SpecificationCMapper;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class SpecificationCServiceImpl implements SpecificationCService{

    private final SpecificationCMapper specificationCMapper;

    @Override
    public Model salaryList(Integer cpage, Model model, String search, HttpSession session) throws Exception {

        Member member = (Member)session.getAttribute("loginUser");

        Long businessNo = member.getBusinessNo();

        Integer employeeCount = specificationCMapper.selectEmployeeCount(businessNo);
        PageInfo pi = new PageInfo(employeeCount, cpage, 10, 10);
        model.addAttribute("pi", pi);
        Integer offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        ArrayList<Member> list = specificationCMapper.selectEmployeeList(rowBounds, search, businessNo);
        list.forEach(employee -> {
            Timestamp createDate = employee.getCreateDate();
            if (createDate != null) {
                Date sqlDate = new Date(createDate.getTime());
                employee.setEnrollDate(sqlDate);
            } else {
                employee.setEnrollDate(null);
            }
        });

        model.addAttribute("employees", list);
        return model;
    }

    @Override
    public Model salaryDetail(Model model, Long userNo) throws Exception {
        Member member = specificationCMapper.findByUserNo(userNo);
        Integer money = specificationCMapper.selectCompanyMoney();

        Timestamp updateAt = member.getPayday();

        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

        // 연도 및 월 추출
        int targetYear = new Date(updateAt.getTime()).getYear() + 1900;
        System.out.println("targetYear = " + targetYear);
        int targetMonth = new Date(updateAt.getTime()).getMonth() + 1;
        System.out.println("targetMonth = " + targetMonth);

        int currentYear = new Date(currentTimestamp.getTime()).getYear() + 1900;
        System.out.println("currentYear = " + currentYear);
        int currentMonth = new Date(currentTimestamp.getTime()).getMonth() + 1;
        System.out.println("currentMonth = " + currentMonth);

        // 비교
        if (currentYear == targetYear && currentMonth == targetMonth) {
            model.addAttribute("paid", 1);
        } else {
            model.addAttribute("paid", 0);
        }

        model.addAttribute("member", member);
        model.addAttribute("money", money);
        return model;
    }

    @Override
    @Transactional
    public void payment(Model model, Long userNo, Integer deduction) throws Exception {
        Timestamp memberUpdateAt = specificationCMapper.selectMemberUpdate(userNo);
        Timestamp companyUpdateAt = specificationCMapper.selectCompanyUpdate();

        Integer updatedSalaryRow = specificationCMapper.updateEmployeeSalary(userNo, memberUpdateAt);
        if(updatedSalaryRow== null||updatedSalaryRow == 0){
            throw new PaymentTransactionException("연봉을 지급하지 못했습니다.");
        }
        Integer updatedCompanyMoney = specificationCMapper.updateCompanyMoney(deduction, companyUpdateAt);
        if(updatedCompanyMoney== null||updatedCompanyMoney == 0){
            throw new PaymentTransactionException("회사 금액이 차감되지 않았습니다.");
        }
    }

    @Override
    public Model monthlyFeeDetail(Model model, Long businessNo) {
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
