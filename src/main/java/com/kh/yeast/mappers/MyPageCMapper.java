package com.kh.yeast.mappers;

import com.kh.yeast.domain.entity.Member;

public interface MyPageCMapper {

    Member selectCMemberById(String userId);

    int updateCMember(Member member);

    String findCManagerByUserNo(Long userNo);
}
