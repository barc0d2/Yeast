package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.company.EmployeeCMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;


@Service
@RequiredArgsConstructor
public class EmployeeCServiceImpl implements EmployeeCService {

    private final EmployeeCMapper employeeCMapper;

    @Override
    public int selectMemberCount() {
        return employeeCMapper.selectMemberCount();
    }

    @Override
    public ArrayList<Member> selectMemberList(PageInfo pi) {
        int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
        return employeeCMapper.selectMemberList(rowBounds);
    }

    @Override
    public Member selectMember(int userNo) {
        return employeeCMapper.selectMember(userNo);
    }
}
