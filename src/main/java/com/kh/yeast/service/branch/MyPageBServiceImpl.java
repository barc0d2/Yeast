package com.kh.yeast.service.branch;

import com.kh.yeast.domain.entity.Member;
import com.kh.yeast.mappers.branch.MyPageBMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

    @Service("myPageBService")
    public class MyPageBServiceImpl implements MyPageBService {

        private final MyPageBMapper myPageBMapper;

        @Autowired
        public MyPageBServiceImpl(MyPageBMapper myPageBMapper) {
            this.myPageBMapper = myPageBMapper;
        }

        @Override
        public Member getBMemberInfo(String userId) {
            return myPageBMapper.selectBMemberById(userId);
        }

        @Override
        public Member getBMemberInfoByUserNo(Long userNo) {
            return myPageBMapper.selectBMemberByUserNo(userNo);
        }

        @Override
        public int updateBMemberInfo(Member member) {
            return myPageBMapper.updateBMember(member);
        }

        @Override
        public String getBManagerName(Long userNo) {
            return findManagerName(userNo);
        }

        private String findManagerName(Long userNo) {
            Member member = myPageBMapper.selectBMemberByUserNo(userNo);

            if (member == null || member.getManagerNo() == null) {
                return "";
            }

            Long managerNo = member.getManagerNo();

            Member manager = myPageBMapper.selectBMemberByUserNo(managerNo);
            if (manager == null) {
                return "";
            }

            return manager.getName();
        }
    }


