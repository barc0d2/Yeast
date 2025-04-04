package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.BreadInventory;
import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.mappers.branch.StoreBMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class StoreBServiceImpl implements StoreBService {

    private final StoreBMapper storeBMapper;

    @Override
    public ArrayList<BreadInventory> dailyBreadList(String businessName) {
        return storeBMapper.inventoryList(businessName);
    }

    @Override
    public Integer insertSell(Sell sell) {
        System.out.println(sell);
        return storeBMapper.insertSell(sell);
    }
}
