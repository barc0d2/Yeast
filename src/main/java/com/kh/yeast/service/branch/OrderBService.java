package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Supply;
import com.kh.yeast.domain.vo.SupplyDetail;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public interface OrderBService {

   int selectOrderCount();

   ArrayList<Supply> selectValue();

   ArrayList<Supply> selectOrderList(PageInfo pi);

    int insert(String branchName, Date orderDate);

    String insert(Supply supply);
}
