package com.kh.yeast.mappers;

import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Supply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Mapper
public interface SupplyMapper {

    int selectOrderCount();

    ArrayList<Supply> selectOrderList(RowBounds rowBounds);

    ArrayList<Supply> selectValue();

    int insert(String branchName, Date orderDate);

    int insert(Supply supply);

    int insertList(String categoryName, String breadName, String quantityList, String priceList);

    int selectDispatchCount();

    ArrayList<Supply> selectDispatchList(RowBounds rowBounds);
}
