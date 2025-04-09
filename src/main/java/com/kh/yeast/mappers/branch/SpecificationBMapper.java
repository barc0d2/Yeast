package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.vo.Business;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.sql.Timestamp;
import java.util.ArrayList;

@Mapper
public interface SpecificationBMapper {
    Integer selectMonthlySellMoney(Long businessNo);

    Integer lastMonthStatus(Long businessNo);

    ArrayList<Business> selectBusinessList(RowBounds rowBounds);

    Timestamp selectUpdateAt(Long businessNo);

    Integer updateSubMoney(Long businessNo, Integer money, Timestamp branchUpdateAt);

    Integer updateAddMoney(Long businessNo, Integer money, Timestamp branchUpdateAt);
}
