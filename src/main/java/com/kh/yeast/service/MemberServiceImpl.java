package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.mappers.company.MemberCMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberCMapper memberCMapper;

    @Override
    public int insertMember(Member member) {
        return memberCMapper.insertMember(member);
    }

    @Override
    public Member loginMember(String userId) {
        return memberCMapper.loginMember(userId);
    }
}
