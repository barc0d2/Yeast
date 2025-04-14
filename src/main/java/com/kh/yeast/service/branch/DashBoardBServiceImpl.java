package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.mappers.branch.DashBoardBMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class DashBoardBServiceImpl implements DashBoardBService {

    private final DashBoardBMapper dashBoardBMapper;

    @Override
    public ArrayList<Member> getBranchMembers() {
        return dashBoardBMapper.selectBranchMembers();
    }
    
    @Override
    public ArrayList<Member> getBranchMembersByBusinessNo(Long businessNo) {
        return dashBoardBMapper.selectBranchMembersByBusinessNo(businessNo);
    }
    
    @Override
    public Member getMemberByName(String userName) {
        return dashBoardBMapper.selectMemberByName(userName);
    }

    @Override
    public ArrayList<Sell> financeList() {
        return dashBoardBMapper.selectFinanceChart();
    }

    @Override
    public ArrayList<Bread> getAllBread() {
        return dashBoardBMapper.selectAllBread();
    }

    @Override
    public ArrayList<Sell> getTodaySalesByBusiness(Long businessNo) {
        return dashBoardBMapper.selectTodaySalesByBusiness(businessNo);
    }
    
    @Override
    public List<Map<String, Object>> getCategorySalesByBusiness(Long businessNo) {
        return dashBoardBMapper.selectCategorySalesByBusiness(businessNo);
    }
}
