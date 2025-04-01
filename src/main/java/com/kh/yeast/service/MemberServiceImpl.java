package com.kh.yeast.service;

import com.kh.yeast.domain.entity.Member;
import com.kh.yeast.mappers.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;

    @Autowired
    public MemberServiceImpl(MemberMapper memberMapper) {
        this.memberMapper = memberMapper;
    }

    @Override
    public int insertMember(Member member) {
        return memberMapper.insertMember(member);
    }

    @Override
    public Member loginMember(String userId) throws Exception {
        return memberMapper.loginMember(userId);
    }
}
