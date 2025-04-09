package com.kh.yeast.mappers;

import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Supply;
import org.apache.ibatis.annotations.Mapper;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Mapper
public interface SupplyMapper {

    List<Supply> modalOpen();

    int selectOrderCount();

    ArrayList<Supply> selectOrderList(PageInfo pi);

    ArrayList<Supply> selectValue();

    int insert(String branchName, Date orderDate);

    int insert(Supply supply);
}
