package com.kh.yeast.mappers.company;

import com.kh.yeast.domain.entity.Bread;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface BreadCMapper {
    Integer selectBreadCount();
    ArrayList<Bread> selectBreadList(RowBounds rowBounds);
    Integer insertBread(Bread bread);
    Integer updateBread(Bread bread);
    Integer updateBreadDetail(Bread bread);
}
