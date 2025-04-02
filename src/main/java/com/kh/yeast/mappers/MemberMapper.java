package com.kh.yeast.mappers;

import com.kh.yeast.domain.entity.Member;
import com.kh.yeast.domain.vo.Bread;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface MemberMapper {
    Integer insertMember(Member member);

    Member loginMember(String userId);


    int selectMemberCount();

    ArrayList<Member> selectMemberList(RowBounds rowBounds);

    Integer insertBread(Bread bread);
}
