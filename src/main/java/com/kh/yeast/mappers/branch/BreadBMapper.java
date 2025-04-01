package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.vo.Bread;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface BreadBMapper {
    Integer selectBreadCount();
    ArrayList<Bread> selectBreadList(RowBounds rowBounds);
}
