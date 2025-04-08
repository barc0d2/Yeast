package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.mappers.branch.MyPageBMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("myPageBService")
public class MyPageBServiceImpl implements MyPageBService {

    private final MyPageBMapper myPageBMapper;

    @Autowired
    public MyPageBServiceImpl(MyPageBMapper myPageBMapper) {
        this.myPageBMapper = myPageBMapper;
    }

    @Override
    public Member getBMemberInfo(Long userNo) {
        return myPageBMapper.selectBMemberByUserNo(userNo); // 🛠️ 수정
    }

    @Override
    public int updateBMemberInfo(Member member) {
        return myPageBMapper.updateBMember(member);
    }

    @Override
    public Member getBManagerName(Long userNo) {
        return myPageBMapper.findBManagerByUserNo(userNo);
    }

    @Override
    public String findBManagerByUserNo(Long userNo) {
        Member member = myPageBMapper.selectBMemberByUserNo(userNo);
        if (member == null || member.getManagerNo() == null) {
            return "";
        }

        Long managerNo = member.getManagerNo();
        Member manager = myPageBMapper.selectBMemberByUserNo(managerNo);

        return manager != null ? manager.getUserName() : "";
    }
}


