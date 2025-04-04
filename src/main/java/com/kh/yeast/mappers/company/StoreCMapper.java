package com.kh.yeast.mappers.company;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Inventory;
import com.kh.yeast.domain.vo.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface StoreCMapper {
    int selectStoreCount();

    ArrayList<Business> selectStoreList(RowBounds rowBounds);

    Business selectStore(@Param("businessNo") int businessNo);

    Integer updateThings(Business business);

    int deleteStore(@Param("businessNo") int businessNo);

    int insertStore(Business business);
    Integer dropBread();
    ArrayList<Inventory> selectInvenCount();
}
