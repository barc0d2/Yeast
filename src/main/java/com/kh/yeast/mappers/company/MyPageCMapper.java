package com.kh.yeast.mappers.company;

import com.kh.yeast.domain.entity.Member;

public interface MyPageCMapper {

    Member selectCMemberById(String userId);

    Member selectCMemberByUserNo(Long userNo);

    int updateCMember(Member member);

    String findCManagerByUserNo(Long userNo);
}
