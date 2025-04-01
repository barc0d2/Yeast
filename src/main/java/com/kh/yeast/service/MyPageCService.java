package com.kh.yeast.service;

import com.kh.yeast.domain.entity.Member;

public interface MyPageCService {

    Member getCMemberInfo(String userId) throws Exception;

    int updateCMemberInfo(Member member) throws Exception;

    String getCManagerName(Long userNo) throws Exception;
}
