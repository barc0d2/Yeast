package com.kh.yeast.mappers;

import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {
   int insertMember(Member member);
   int idCheck(@Param("userId") String userId);
}