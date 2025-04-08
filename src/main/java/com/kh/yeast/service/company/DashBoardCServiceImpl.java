package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.Inventory;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.mappers.company.DashBoardCMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class DashBoardCServiceImpl implements DashBoardCService {

    private final DashBoardCMapper dashBoardCMapper;

    @Override
    public ArrayList<Inventory> productionList() {
        return dashBoardCMapper.selectInventoryByCategory();
    }

    @Override
    public int getTotalInventoryAmount() {
        return dashBoardCMapper.selectTotalInventoryAmount();
    }

    @Override
    public ArrayList<Member> getAllMembers() {
        return dashBoardCMapper.selectAllMembers();
    }

    @Override
    public ArrayList<Sell> getTodaySales() {
        return dashBoardCMapper.selectTodaySales();
    }

    @Override
    public ArrayList<Bread> getAllBread() {
        return dashBoardCMapper.selectAllBread();
    }

    @Override
    public ArrayList<Business> getAllBusinesses() {
        return dashBoardCMapper.selectAllBusinesses();
    }

    @Override
    public ArrayList<Sell> getTodaySalesByBusiness(Long businessNo) {
        return dashBoardCMapper.selectTodaySalesByBusiness(businessNo);
    }
}