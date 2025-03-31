package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;
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
    public int insertMember(Member m) {
        return memberMapper.insertMember(m);
    }
}
