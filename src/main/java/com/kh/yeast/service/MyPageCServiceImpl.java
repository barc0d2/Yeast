package com.kh.yeast.service;

import com.kh.yeast.domain.entity.Member;
import com.kh.yeast.mappers.MyPageCMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("myPageCService")
public class MyPageCServiceImpl implements MyPageCService {

    private final MyPageCMapper myPageCMapper;

    @Autowired
    public MyPageCServiceImpl(MyPageCMapper myPageCMapper) {
        this.myPageCMapper = myPageCMapper;
    }

    @Override
    public Member getCMemberInfo(String userId) throws Exception {
        return myPageCMapper.selectCMemberById(userId);
    }

    @Override
    public int updateCMemberInfo(Member member) throws Exception {
        return myPageCMapper.updateCMember(member);
    }

    @Override
    public String getCManagerName(Long userNo) {
        return myPageCMapper.findCManagerByUserNo(userNo);
    }
}
