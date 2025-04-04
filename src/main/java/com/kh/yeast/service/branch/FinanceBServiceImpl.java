package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.BreadInventory;
import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.mappers.branch.FinanceBMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class FinanceBServiceImpl implements FinanceBService {

    private final FinanceBMapper financeBMapper;

    @Override
    public ArrayList<BreadInventory> dailyBreadList(String businessName) {
        return financeBMapper.inventoryList(businessName);
    }

    @Override
    public Integer insertSell(Sell sell) {
        return financeBMapper.insertSell(sell);
    }
}
