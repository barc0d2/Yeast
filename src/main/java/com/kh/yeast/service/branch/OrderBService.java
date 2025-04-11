package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Supply;

import java.sql.Date;
import java.util.ArrayList;

public interface OrderBService {

   int selectOrderCount(long businessNo);

   ArrayList<Supply> selectValue();

   ArrayList<Supply> selectOrderList(long businessNo, PageInfo pi);

    int insert(String branchName, Date orderDate);

    String insert(Supply supply);

    int insertList(String categoryName, String breadName, String quantityList, String priceList);

    int night();

    ArrayList<Supply> selectUpdate(int supplyNo);

    Supply selectUpdateInfo(int supplyNo);

    int deleteList(long supplyNo);

    int businessMoney(long businessNo);

    int updateBusinessMoney(long businessNo, int totalSumPrice);

    int updateMoney(long businessNo, long totalPrice);
}
