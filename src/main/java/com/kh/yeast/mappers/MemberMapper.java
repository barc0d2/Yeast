package com.kh.yeast.mappers;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface MemberMapper {
    int insertMember(Member member);

    Member loginMember(String userId);

    int selectMemberCount();

    ArrayList<Member> selectMemberList(RowBounds rowBounds);
}
