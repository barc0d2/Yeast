package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Position;
import com.kh.yeast.mappers.company.MyPageCMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service("myPageCService")
public class MyPageCServiceImpl implements MyPageCService {

    private final MyPageCMapper myPageCMapper;


    @Override
    public Member selectMember(Long userNo) {
        return myPageCMapper.selectMember(userNo) ;
    }

    @Override
    public int update(Member member) {
        return myPageCMapper.update(member);
    }

    @Override
    public List<Position> getAllPositions() {
        return myPageCMapper.getAllPositions();
    }

    @Override
    public List<Business> getAllBusinesses() {
        return myPageCMapper.getAllBusinesses();
    }

    @Override
    public int updatePwd(long userNo, String pwd) {
        return myPageCMapper.updatePwd(userNo, pwd);
    }


}
