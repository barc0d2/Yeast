package com.kh.yeast.service;

<<<<<<< HEAD
import com.kh.yeast.domain.entity.Member;
=======
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
>>>>>>> intae
import com.kh.yeast.mappers.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;

    @Override
    public int insertMember(Member member) {
        return memberMapper.insertMember(member);
    }

    @Override
    public Member loginMember(String userId) throws Exception {
        return memberMapper.loginMember(userId);
    }

    @Override
    public int selectMemberCount() {
        return memberMapper.selectMemberCount();
    }

    @Override
    public ArrayList<Member> selectMemberList(PageInfo pi) {
        int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
        return memberMapper.selectMemberList(rowBounds);
    }
}
