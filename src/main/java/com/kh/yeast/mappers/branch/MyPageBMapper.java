package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Position;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MyPageBMapper {

   Member selectMember(@Param("userNo") long userNo);

   List<Position> getAllPositions();

   List<Business> getAllBusinesses();

   int update(Member member);
}

