package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.mappers.branch.STableBMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Service
public class STableBServiceImpl implements STableBService {

        private final STableBMapper stableBMapper;

        public STableBServiceImpl( STableBMapper stableBMapper) {
            this.stableBMapper = stableBMapper;

        }

        @Override
        public Integer getEmployeeCount() {
            return stableBMapper.selectEmployeeCount();
        }

        @Override
        public List<Member> getEmployeeList(RowBounds rowBounds) {
            return stableBMapper.selectEmployeeList(rowBounds);
        }

    @Override
    public List<Member> findEmployeesByName(String userName) {
        List<Member> members = stableBMapper.findEmployeesByName(userName);

        for (Member member : members) {
            if (member.getHeadName() == null) {
                member.setHeadName("없음");
            }


            if (member.getUpdateAt() != null) {
                LocalDate now = LocalDate.now();
                boolean sameMonth = member.getUpdateAt().getYear() == now.getYear() &&
                        member.getUpdateAt().getMonth() == now.getMonth();
                member.setStatus(sameMonth ? 1 : 0);
            } else {
                member.setStatus(0);
            }
            System.out.println("사용자: " + member.getUserName() + " / updateAt: " + member.getUpdateAt());
        }


        return members;
    }

    @Override
    public Member findByUserNo(Long userNo) {
        return stableBMapper.findByUserNo(userNo);
    }

    @Override
    public Member findByUserName(String userName) {
        return stableBMapper.findByUserName(userName);
    }

}
