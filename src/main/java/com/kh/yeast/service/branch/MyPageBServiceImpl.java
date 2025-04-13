package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Position;
import com.kh.yeast.mappers.branch.MyPageBMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MyPageBServiceImpl implements MyPageBService {

    private final MyPageBMapper myPageBMapper;

    @Override
    public Member selectMember(long userNo) {
        return myPageBMapper.selectMember(userNo);
    }

    @Override
    public List<Position> getAllPositions() {
        return myPageBMapper.getAllPositions();
    }

    @Override
    public List<Business> getAllBusinesses() {
        return myPageBMapper.getAllBusinesses();
    }

    @Override
    public int update(Member member) {
        return myPageBMapper.update(member);
    }

    @Override
    public int updatePwd(long userNo, String pwd) {
        return myPageBMapper.updatePwd(userNo, pwd);
    }
}


