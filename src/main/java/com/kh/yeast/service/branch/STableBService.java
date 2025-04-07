package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface STableBService {

    Integer getEmployeeCount();

    List<Member> getEmployeeList(RowBounds rowBounds);

    List<Member> findEmployeesByName(String userName);

    Member findByUserNo(Long userNo);

    Member findByUserName(String userName);
}
