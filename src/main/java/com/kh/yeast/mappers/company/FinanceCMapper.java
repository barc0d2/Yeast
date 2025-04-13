package com.kh.yeast.mappers.company;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.domain.vo.Supply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface FinanceCMapper {
    Integer selectBranchCount();

    ArrayList<Sell> selectRecentlySellList(RowBounds rowBounds);
    Integer selectSellCount(Long businessNo, String period);
    ArrayList<Sell> selectSellList(Long businessNo, String period, RowBounds rowBounds);

    ArrayList<Business> selectBusinessList(RowBounds rowBounds);

    ArrayList<Supply> selectRecentlyWholesaleList(Long businessNo);
    Integer selectWholesaleCount(Long businessNo, String period);
    ArrayList<Supply> selectWholesaleList(Long businessNo,String period, RowBounds rowBounds);
}
