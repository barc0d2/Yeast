package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.entity.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MyPageBMapper {

        Member selectBMemberById(String userId);

        Member selectBMemberByUserNo(Long userNo);

        int updateBMember(Member member);

        String findBManagerByUserNo(Long userNo);
    }

