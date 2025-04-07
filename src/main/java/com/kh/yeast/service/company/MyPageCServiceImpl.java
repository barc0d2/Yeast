package com.kh.yeast.service.company;

import com.kh.yeast.domain.entity.Member;
import com.kh.yeast.mappers.company.MyPageCMapper;
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
    public Member getCMemberInfo(String userId) {
        return myPageCMapper.selectCMemberById(userId);
    }

    @Override
    public Member getCMemberInfoByUserNo(Long userNo) {
        return myPageCMapper.selectCMemberByUserNo(userNo);
    }

    @Override
    public int updateCMemberInfo(Member member) {
        return myPageCMapper.updateCMember(member);
    }

    @Override
    public String getCManagerName(Long userNo) {
        return findManagerName(userNo);
    }

    private String findManagerName(Long userNo) {
        Member member = myPageCMapper.selectCMemberByUserNo(userNo);

        if (member == null || member.getManagerNo() == null) {  // 🔹 `getManagerNo()` 사용
            return "";
        }

        Long managerNo = member.getManagerNo();  // 🔹 변경된 필드명 적용

        Member manager = myPageCMapper.selectCMemberByUserNo(managerNo);
        if (manager == null) {
            return "";
        }

        return manager.getUserName();  // 🔹 필드명 올바르게 수정
    }
}
