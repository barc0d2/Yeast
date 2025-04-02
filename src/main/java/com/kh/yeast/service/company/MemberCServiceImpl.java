package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.company.MemberCMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;


@Service
@RequiredArgsConstructor
public class MemberCServiceImpl implements MemberCService {

    private final MemberCMapper memberCMapper;

    @Override
    public int insertMember(Member member) {
        return memberCMapper.insertMember(member);
    }

    @Override
    public Member loginMember(String userId) throws Exception {
        return memberCMapper.loginMember(userId);
    }

    @Override
    public int selectMemberCount() {
        return memberCMapper.selectMemberCount();
    }

    @Override
    public ArrayList<Member> selectMemberList(PageInfo pi) {
        int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
        return memberCMapper.selectMemberList(rowBounds);
    }

    @Override
    public Member selectMember(int userNo) {
        return memberCMapper.selectMember(userNo);
    }
}
