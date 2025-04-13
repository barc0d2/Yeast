package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Position;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface MyPageBService {

    Member selectMember(long userNo);

    List<Position> getAllPositions();

    List<Business> getAllBusinesses();

    int update(Member member);
}
