package com.kh.yeast.service.company;

import com.kh.yeast.domain.entity.Member;

public interface MyPageCService {

     Member getCMemberInfo(String userId) throws Exception;

     Member getCMemberInfoByUserNo(Long userNo) throws Exception;

     int updateCMemberInfo(Member member) throws Exception;

     String getCManagerName(Long userNo);
}