package com.kh.yeast.mappers;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface MemberMapper {
    Integer insertMember(Member member);

    Member loginMember(String userId);
}
