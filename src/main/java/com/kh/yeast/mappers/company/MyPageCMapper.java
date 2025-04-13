package com.kh.yeast.mappers.company;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Position;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MyPageCMapper {

    Member selectMember(Long userNo);

    int update(Member member);

    List<Position> getAllPositions();

    List<Business> getAllBusinesses();

    int updatePwd(@Param("userNo") long userNo, @Param("pwd") String pwd);
}
