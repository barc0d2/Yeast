package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.mappers.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageServiceImpl implements MyPageService {

    private final MemberMapper memberMapper;

    @Autowired
    public MyPageServiceImpl(MemberMapper memberMapper) {
        this.memberMapper = memberMapper;
    }

    @Override
    public Member getMemberInfo(String userId) throws Exception {
        return memberMapper.selectMemberById(userId);
    }

    @Override
    public int updateMemberInfo(Member member) throws Exception {
        return memberMapper.updateMember(member);
    }
}
