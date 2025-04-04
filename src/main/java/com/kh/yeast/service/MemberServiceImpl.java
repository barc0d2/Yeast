package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.mappers.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

@Service
@RequiredArgsConstructor
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

    @Override
    public Member loginMember(String userId) {
        Member member = memberMapper.loginMember(userId);
        System.out.println("member:"+member);
        Timestamp createDate = member.getCreateDate();
        if (createDate != null) {
            Date sqlDate = new Date(createDate.getTime());
            member.setEnrollDate(sqlDate);
        } else {
            member.setEnrollDate(null);
        }

        return member;
    }

}