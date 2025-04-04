package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Position;
import com.kh.yeast.domain.vo.Business;

import java.util.List;



public interface MemberService {
    Integer insertMember(Member member);
    Integer idCheck(String checkId);

    Member loginMember(String userId) throws Exception;

    Integer emailCheck(String checkEmail);
    
    List<Position> getAllPositions();
    
    List<Business> getAllBusinesses();
}