package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Position;
import com.kh.yeast.domain.vo.Business;

import java.util.List;
import java.util.Map;



public interface MemberService {
    Integer insertMember(Member member);
    Integer idCheck(String checkId);

    Member loginMember(String userId);

    Integer emailCheck(String checkEmail);
    
    List<Position> getAllPositions();
    
    List<Business> getAllBusinesses();
    
    Member findManagerByName(String managerName);

    int delete(long userNo);
}