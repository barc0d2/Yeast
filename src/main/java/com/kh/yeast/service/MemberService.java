package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.ArrayList;

public interface MemberService {
    int insertMember(Member member);
    int idCheck(String checkId);

    Member loginMember(String userId) throws Exception;

}