package com.kh.yeast.service;

import com.kh.yeast.domain.entity.Member;
import com.kh.yeast.mappers.MyPageBMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("myPageService")
public class MyPageBServiceImpl implements MyPageBService {

    private final MyPageBMapper myPageBMapper;

    @Autowired
    public MyPageBServiceImpl(MyPageBMapper myPageBMapper) {
        this.myPageBMapper = myPageBMapper;
    }

    @Override
    public Member getBMemberInfo(String userId) throws Exception {
        return myPageBMapper.selectBMemberById(userId);
    }

    @Override
    public int updateBMemberInfo(Member member) throws Exception {
        return myPageBMapper.updateBMember(member);
    }

    @Override
    public String getBManagerName(Long userNo) {
        return myPageBMapper.findBManagerByUserNo(userNo);
    }
}
