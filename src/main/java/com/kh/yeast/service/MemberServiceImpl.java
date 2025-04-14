package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Position;
import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.mappers.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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
        if (member != null) {
            Timestamp createDate = member.getCreateDate();
            if (createDate != null) {
                Date sqlDate = new Date(createDate.getTime());
                member.setEnrollDate(sqlDate);
            } else {
                member.setEnrollDate(null);
            }
        }
        return member;
    }

    @Override
    public Integer emailCheck(String checkEmail) {
        return memberMapper.emailCheck(checkEmail);
    }
    
    @Override
    public List<Position> getAllPositions() {
        return memberMapper.getAllPositions();
    }
    
    @Override
    public List<Business> getAllBusinesses() {
        return memberMapper.getAllBusinesses();
    }
    
    @Override
    public Member findManagerByName(String managerName) {
        return memberMapper.findManagerByName(managerName);
    }

    @Override
    public int delete(long userNo) {
        return memberMapper.delete(userNo);
    }
}