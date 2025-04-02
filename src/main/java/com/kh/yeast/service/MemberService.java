package com.kh.yeast.service;

import com.kh.yeast.domain.entity.Member;
import com.kh.yeast.domain.vo.PageInfo;
import java.util.ArrayList;

public interface MemberService {

    int insertMember(Member member) throws Exception;

    Member loginMember(String userId) throws Exception;


    int selectMemberCount();

    ArrayList<Member> selectMemberList(PageInfo pi);

}
