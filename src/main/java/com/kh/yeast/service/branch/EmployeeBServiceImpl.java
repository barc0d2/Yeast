package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.branch.EmployeeBMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class EmployeeBServiceImpl implements EmployeeBService {

    private final EmployeeBMapper employeeBMapper;


    @Override
    public int selectMemberCount() {
        int memberCount = employeeBMapper.selectMemberCount();
        System.out.println(memberCount);
        return memberCount;
    }

    @Override
    public ArrayList<Member> selectMemberList(PageInfo pi) {
        int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
        return employeeBMapper.selectMemberList(rowBounds);
    }

    @Override
    public Member selectMember(int userNo) {
        return employeeBMapper.selectMember(userNo);
    }
}
