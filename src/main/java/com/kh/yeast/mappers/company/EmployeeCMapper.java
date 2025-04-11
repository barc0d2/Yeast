package com.kh.yeast.mappers.company;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface EmployeeCMapper {

    int selectMemberCount();

    ArrayList<Member> selectMemberList(RowBounds rowBounds);

    Member selectMember(@Param("userNo") int userNo);

    int update(Member member);

    int selectAllMemberCount();

    ArrayList<Member> selectAllMemberList(RowBounds rowBounds);
}
