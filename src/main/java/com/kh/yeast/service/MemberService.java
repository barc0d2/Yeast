package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;


public interface MemberService {
    Integer insertMember(Member member);
    Integer idCheck(String checkId);

    Member loginMember(String userId) throws Exception;

}