package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.company.EmployeeCMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Timestamp;
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

        ArrayList<Member> memberList = employeeCMapper.selectMemberList(rowBounds);
        memberList.forEach(member -> {
            Timestamp createDate = member.getCreateDate();
            if (createDate != null) {
                Date sqlDate = new Date(createDate.getTime());
                member.setEnrollDate(sqlDate);
            } else {
                member.setEnrollDate(null);
            }
        });
        return memberList;
    }

    @Override
    public Member selectMember(int userNo) {
        return employeeCMapper.selectMember(userNo);
    }

    @Override
    public int update(Member member) {
        return employeeCMapper.update(member);
    }
}
