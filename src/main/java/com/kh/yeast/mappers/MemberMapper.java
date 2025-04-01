package com.kh.yeast.mappers;

import com.kh.yeast.domain.vo.Member;

public interface MemberMapper {
    void insertMember(Member member);
    int checkUserId(String userId);
    Member selectMemberById(String userId);
}
