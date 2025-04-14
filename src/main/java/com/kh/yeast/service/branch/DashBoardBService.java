package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Sell;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public interface DashBoardBService {

    ArrayList<Member> getBranchMembers();


    ArrayList<Member> getBranchMembersByBusinessNo(Long businessNo);

    Member getMemberByName(String userName);

    ArrayList<Sell> financeList();

    ArrayList<Bread> getAllBread();

    ArrayList<Sell> getTodaySalesByBusiness(Long businessNo);
    

    List<Map<String, Object>> getCategorySalesByBusiness(Long businessNo);
}
