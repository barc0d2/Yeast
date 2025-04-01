package com.kh.yeast.mappers;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    Integer insertMember(Member member);

    Member loginMember(String userId);

    Integer insertBread(Bread bread);
}
