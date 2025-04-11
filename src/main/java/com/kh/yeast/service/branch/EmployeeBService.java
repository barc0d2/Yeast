package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;

import java.util.ArrayList;

public interface EmployeeBService {

    int selectMemberCount(long businessNo);

    ArrayList<Member> selectMemberList(long businessNo, PageInfo pi);

    Member selectMember(int userNo);

    int update(Member member);

    int selectAllMemberCount();

    ArrayList<Member> selectAllMemberList(PageInfo pi);
}
