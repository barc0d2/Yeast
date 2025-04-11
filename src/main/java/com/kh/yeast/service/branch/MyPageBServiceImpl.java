package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.mappers.branch.MyPageBMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MyPageBServiceImpl implements MyPageBService {

    private final MyPageBMapper myPageBMapper;

    @Override
    public Member selectMember(int userNo) {
        return myPageBMapper.selectMember(userNo);
    }
}


