package com.kh.yeast.mappers;

import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    int insertMember(Member member);

    Member loginMember(String userId);

    Member selectMemberById(String userId);

    int updateMember(Member member);


}
