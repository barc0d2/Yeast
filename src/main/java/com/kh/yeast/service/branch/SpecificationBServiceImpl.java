package com.kh.yeast.service.branch;

import com.kh.yeast.customException.PaymentTransactionException;
import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.branch.SpecificationBMapper;
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
public class SpecificationBServiceImpl implements SpecificationBService {

    private final SpecificationBMapper specificationBMapper;

    @Override
    public Model salaryList(Integer cpage, Model model, String search, HttpSession session) throws Exception {

        Member member = (Member)session.getAttribute("loginUser");

        Long businessNo = member.getBusinessNo();

        Integer employeeCount = specificationBMapper.selectEmployeeCount(businessNo);
        PageInfo pi = new PageInfo(employeeCount, cpage, 10, 10);
        model.addAttribute("pi", pi);
        Integer offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        ArrayList<Member> list = specificationBMapper.selectEmployeeList(rowBounds, search, businessNo);
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
    public Model salaryDetail(Model model, Long userNo, HttpSession session) throws Exception {
        Member loginUser = (Member)session.getAttribute("loginUser");
        Long businessNo = loginUser.getBusinessNo();

        Member member = specificationBMapper.findByUserNo(userNo);
        Integer money = specificationBMapper.selectCompanyMoney(businessNo);

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
    public void payment(Model model, Long userNo, Integer deduction, HttpSession session) throws Exception {
        Member member = (Member)session.getAttribute("loginUser");
        Long businessNo = member.getBusinessNo();
        Timestamp memberUpdateAt = specificationBMapper.selectMemberUpdate(userNo);
        Timestamp companyUpdateAt = specificationBMapper.selectCompanyUpdate(businessNo);

        Integer updatedSalaryRow = specificationBMapper.updateEmployeeSalary(userNo, memberUpdateAt);
        if(updatedSalaryRow== null||updatedSalaryRow == 0){
            throw new PaymentTransactionException("연봉을 지급하지 못했습니다.");
        }
        Integer updatedCompanyMoney = specificationBMapper.updateCompanyMoney(deduction, companyUpdateAt, businessNo);
        if(updatedCompanyMoney== null||updatedCompanyMoney == 0){
            throw new PaymentTransactionException("회사 금액이 차감되지 않았습니다.");
        }
    }

    @Override
    public Model monthlyFee(Model model, HttpSession session) {

        Member member = (Member) session.getAttribute("loginUser");
        Long businessNo = member.getBusinessNo();

        Integer monthSellMoney = specificationBMapper.selectMonthlySellMoney(businessNo);
        model.addAttribute("monthSellMoney", monthSellMoney);
        Integer status = specificationBMapper.lastMonthStatus(businessNo);
        model.addAttribute("status", status);
        RowBounds rowBounds = new RowBounds(1, Integer.MAX_VALUE);
        ArrayList<Business> businessList = specificationBMapper.selectBusinessList(rowBounds);
        model.addAttribute("businessList", businessList);
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
