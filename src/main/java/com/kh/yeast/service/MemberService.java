package com.kh.yeast.service;

import org.springframework.web.multipart.MultipartFile;

public interface MemberService {
    void registerMember(MemberRegistrationDTO registrationDTO, MultipartFile profileImage) throws Exception;
    boolean isUserIdAvailable(String userId);
    Member getMemberById(String userId);
}
