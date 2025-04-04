package com.kh.yeast.mappers;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Position;
import com.kh.yeast.domain.vo.Business;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MemberMapper {
   Integer insertMember(Member member);
   Integer idCheck(@Param("userId") String userId);
   Integer emailCheck(@Param("email") String email);
   Member loginMember(String userId);
   
   List<Position> getAllPositions();
   List<Business> getAllBusinesses();
}