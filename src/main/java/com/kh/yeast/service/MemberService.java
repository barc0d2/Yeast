package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;

import java.util.List;
import java.util.Map;


public interface MemberService {
    Integer insertMember(Member member);
    Integer idCheck(String checkId);

    Member loginMember(String userId) throws Exception;

    Integer emailCheck(String checkEmail);
}