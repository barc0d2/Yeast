package com.kh.yeast.service;

<<<<<<< HEAD
import com.kh.yeast.domain.entity.Member;
=======
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.PageInfo;

import java.util.ArrayList;
>>>>>>> intae

public interface MemberService {

    int insertMember(Member member) throws Exception;

    Member loginMember(String userId) throws Exception;

<<<<<<< HEAD
=======
    int selectMemberCount();

    ArrayList<Member> selectMemberList(PageInfo pi);

>>>>>>> intae
}
