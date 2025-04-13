package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MyPageBMapper {

   Member selectMember(@Param("userNo") long userNo);

   int update(Member member);
}

