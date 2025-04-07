package com.kh.yeast.mappers.branch;

import com.kh.yeast.domain.entity.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPagePopUpBMapper {

        int updateMember(Member member);
    }
