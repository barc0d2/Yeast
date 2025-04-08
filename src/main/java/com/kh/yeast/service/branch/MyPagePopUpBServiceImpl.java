package com.kh.yeast.service.branch;


import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.mappers.branch.MyPagePopUpBMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MyPagePopUpBServiceImpl implements MyPagePopUpBService {

    private final MyPagePopUpBMapper myPagePopUpBMapper;

    public MyPagePopUpBServiceImpl(MyPagePopUpBMapper myPagePopUpBMapper) {
        this.myPagePopUpBMapper = myPagePopUpBMapper;
    }

    @Override
    @Transactional
    public boolean updateBMemberInfo(Member member) {
        int updatedCount = myPagePopUpBMapper.updateMember(member);
        return updatedCount > 0;
    }
}
