package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MyPageBMapper {

        Member selectBMemberByUserNo(@Param("userNo") Long userNo);

        int updateBMember(Member member);

        Member findBManagerByUserNo(@Param("userNo") Long userNo); // 🛠️ 수정
    }

