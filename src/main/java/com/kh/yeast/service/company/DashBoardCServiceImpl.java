package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Inventory;
import com.kh.yeast.domain.vo.Sell;
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
}
