package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Supply;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface DispatchCService {
    int selectDispatchCount();

    ArrayList<Supply> selectDispatchList(PageInfo pi);

    ArrayList<Supply> selectSupply(int supplyNo);

    Supply selectSupplyInfo(int supplyNo);

    int approval(int supplyNo);

    int updateInventory(int branchNo, int breadNo, int quantity);
}
