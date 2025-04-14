package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.branch.EmployeeBMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class EmployeeBServiceImpl implements EmployeeBService {

    private final EmployeeBMapper employeeBMapper;


    @Override
    public int selectMemberCount(long businessNo) {
        int memberCount = employeeBMapper.selectMemberCount(businessNo);
        return memberCount;
    }

    @Override
    public ArrayList<Member> selectMemberList(long businessNo, PageInfo pi) {
        int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
        ArrayList<Member> memberList = employeeBMapper.selectMemberList(businessNo, rowBounds);
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
        return employeeBMapper.selectMember(userNo);
    }

    @Override
    public int update(Member member) {
        return employeeBMapper.update(member);
    }

    @Override
    public int selectAllMemberCount() {
        int memberCount = employeeBMapper.selectAllMemberCount();
        return memberCount;
    }

    @Override
    public ArrayList<Member> selectAllMemberList(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        ArrayList<Member> memberList = employeeBMapper.selectAllMemberList(rowBounds);
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


}
