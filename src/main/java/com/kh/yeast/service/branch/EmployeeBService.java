package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;

import java.util.ArrayList;

public interface EmployeeBService {

    int selectMemberCount();

    ArrayList<Member> selectMemberList(PageInfo pi);

    Member selectMember(int userNo);
}
