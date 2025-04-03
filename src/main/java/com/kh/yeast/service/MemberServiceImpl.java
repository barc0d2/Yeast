package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.mappers.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;


    @Override
    public Integer insertMember(Member member) {
        return memberMapper.insertMember(member);
    }

    @Override
    public Integer idCheck(String userId) {
        return memberMapper.idCheck(userId);
    }
}