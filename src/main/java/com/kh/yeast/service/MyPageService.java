package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;

public interface MyPageService {
    Member getMemberInfo(String userId) throws Exception;

    int updateMemberInfo(Member member) throws Exception;
}
