package com.kh.yeast.mappers;

import com.kh.yeast.domain.entity.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageBMapper {
    Member selectBMemberById(String userId);

    int updateBMember(Member member);

    String findBManagerByUserNo(Long userNo);

}
