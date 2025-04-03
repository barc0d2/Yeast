package com.kh.yeast.mappers;


import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {
   Integer insertMember(Member member);
   Integer idCheck(@Param("userId") String userId);
   Integer emailCheck(@Param("email") String email);

   Member loginMember(String userId);;
}