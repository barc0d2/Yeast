package com.kh.yeast.service;

import com.kh.yeast.domain.entity.Member;

public interface MyPageBService {
    Member getBMemberInfo(String userId) throws Exception;

    int updateBMemberInfo(Member member) throws Exception;

    String getBManagerName(Long userNo);
}
