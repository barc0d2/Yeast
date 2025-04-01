package com.kh.yeast.service;

import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;

public interface MemberService {
    void registerMember(
            String gender, String positionName, String businessName, String managerName,
            String userName, String userId, String userPwd, String email, String birthday,
            String phone, String address, MultipartFile profileImage) throws IOException;

    boolean isUserIdAvailable(String userId);
}