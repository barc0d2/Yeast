package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;

public interface MemberService {

    int insertMember(Member member);

    Member loginMember(String userId) throws Exception;

}
