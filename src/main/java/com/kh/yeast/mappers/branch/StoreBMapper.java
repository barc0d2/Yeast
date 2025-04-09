package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Inventory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface StoreBMapper {
    Business selectStore(@Param("businessNo") long businessNo);

    Integer updateThings(Business business);
}
