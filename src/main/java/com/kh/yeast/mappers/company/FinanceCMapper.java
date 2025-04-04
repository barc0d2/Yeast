package com.kh.yeast.mappers.company;

import com.kh.yeast.domain.vo.Sell;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface FinanceCMapper {
    ArrayList<Sell> selectSellList();
    ArrayList<String> selectSellList(String breadList);
}
