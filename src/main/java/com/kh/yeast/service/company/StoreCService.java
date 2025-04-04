package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.PageInfo;

import java.util.ArrayList;

public interface StoreCService {

    Integer selectStoreCount();

    ArrayList<Business> selectStoreList(PageInfo pi);

    Business selectStore(int businessNo);
    Integer updateThings(Business business) throws Exception;
    int deleteStore(int businessNo);
    int insertStore(Business business) throws Exception;

    Integer dropBread();
}
