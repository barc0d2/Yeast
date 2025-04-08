package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface MyPageBService {

    Member getBMemberInfo(Long userNo) throws Exception;

    String findBManagerByUserNo(@Param("userNo") Long userNo);


    int updateBMemberInfo(Member member) throws Exception;

    Member getBManagerName(Long userNo);



}
