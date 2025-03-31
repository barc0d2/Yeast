package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Position;
import com.kh.yeast.repository.BusinessRepository;
import com.kh.yeast.repository.MemberRepository;
import com.kh.yeast.repository.PositionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageService {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private PositionRepository positionRepository;

    @Autowired
    private BusinessRepository businessRepository;

    public Member getUserById(String userId) {
        try {
            return memberRepository.findByUserId(userId);
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch user by ID", e);
        }
    }

    public Position getPositionById(Long positionNo) {
        try {
            return positionRepository.findByPositionNo(positionNo);
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch position by ID", e);
        }
    }

    public Business getBusinessById(Long businessNo) {
        try {
            return businessRepository.findByBusinessNo(businessNo);
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch business by ID", e);
        }
    }

    public void updateUser(Member member) {
        try {
            memberRepository.save(member);
        } catch (Exception e) {
            throw new RuntimeException("Failed to update user", e);
        }
    }
}
