package com.kh.yeast.mappers;

import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    int insertMember(Member m);
}
