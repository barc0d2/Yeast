package com.kh.yeast.service;

import com.kh.yeast.domain.entity.Member;

public interface MemberService {

    int insertMember(Member member) throws Exception;

    Member loginMember(String userId) throws Exception;

}
