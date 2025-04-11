package com.kh.yeast.mappers;

import com.kh.yeast.domain.vo.Supply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.sql.Date;
import java.util.ArrayList;

@Mapper
public interface SupplyMapper {

    int selectOrderCount(@Param("businessNo") long businessNo);

    ArrayList<Supply> selectOrderList(@Param("businessNo") long businessNo, RowBounds rowBounds);

    ArrayList<Supply> selectValue();

    int insert(String branchName, Date orderDate);

    int insert(Supply supply);

    int insertList(String categoryName, String breadName, String quantityList, String priceList);

    int selectDispatchCount();

    ArrayList<Supply> selectDispatchList(RowBounds rowBounds);

    ArrayList<Supply> selectSupply(@Param("supplyNo") int supplyNo);

    Supply selectSupplyInfo(@Param("supplyNo") int supplyNo);

    int night();

    int approval(@Param("supplyNo") int supplyNo);

    ArrayList<Supply> selectUpdate(@Param("supplyNo") int supplyNo);

    Supply selectUpdateInfo(@Param("supplyNo") int supplyNo);

    int deleteList(@Param("supplyNo") long supplyNo);

    int businessMoney(long businessNo);

    int updateBusinessMoney(@Param("businessNo") long businessNo, @Param("totalSumPrice") int totalSumPrice);

    int updateInventory(@Param("businessNo") int branchNo,@Param("breadNo") int breadNo,@Param("invenCount") int quantity);

    int updateMoney(@Param("businessNo") long businessNo ,@Param("totalPrice") long totalPrice);
}
