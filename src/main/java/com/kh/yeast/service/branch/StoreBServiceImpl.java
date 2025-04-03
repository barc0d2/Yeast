package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.BreadInventory;
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
/*        for (BreadRevenue breadRevenue : inventoryList) {
            Integer price = (int) ((Math.random() * breadRevenue.getInvenCount()) + 1);
            breadRevenue.setInvenCount(saleQuantity);
            breadRevenue.setInvenCount(breadRevenue.getInvenCount() - saleQuantity);
            breadRevenue.setTotalMoney(saleQuantity * breadRevenue.getPrice());
        }*/
        return storeBMapper.inventoryList(businessName);
    }
}
