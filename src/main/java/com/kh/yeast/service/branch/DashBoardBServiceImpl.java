package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.mappers.branch.DashBoardBMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

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
}
