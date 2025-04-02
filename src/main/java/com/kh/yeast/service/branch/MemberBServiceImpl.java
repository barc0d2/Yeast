package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.branch.MemberBMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class MemberBServiceImpl implements MemberBService {

    private final MemberBMapper memberBMapper;


    @Override
    public int selectMemberCount() {
        int memberCount = memberBMapper.selectMemberCount();
        System.out.println(memberCount);
        return memberCount;
    }

    @Override
    public ArrayList<Member> selectMemberList(PageInfo pi) {
        int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
        return memberBMapper.selectMemberList(rowBounds);
    }

    @Override
    public Member selectMember(int userNo) {
        return memberBMapper.selectMember(userNo);
    }
}
