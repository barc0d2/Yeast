package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.domain.vo.Position;

import java.util.List;

public interface MyPageCService {

     Member selectMember(Long userNo);

     int update(Member member);

     List<Position> getAllPositions();

     List<Business> getAllBusinesses();
}