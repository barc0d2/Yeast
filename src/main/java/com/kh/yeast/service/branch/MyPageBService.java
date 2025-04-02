package com.kh.yeast.service.branch;

import com.kh.yeast.domain.entity.Employee;
import com.kh.yeast.domain.entity.Member;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface MyPageBService {

    Member getBMemberInfo(String userId) throws Exception;

    Member getBMemberInfoByUserNo(Long userNo) throws Exception;

    int updateBMemberInfo(Member member) throws Exception;

    String getBManagerName(Long userNo);

}
