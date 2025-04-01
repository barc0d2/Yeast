package com.kh.yeast.service;

import com.kh.yeast.domain.vo.Member;
import com.kh.yeast.mappers.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.UUID;

@RequiredArgsConstructor
@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

    private MemberMapper memberMapper;

    private PasswordEncoder passwordEncoder;

    @Override
    public boolean isUserIdAvailable(String userId) {
        if (userId == null || userId.trim().isEmpty()) {
            return false;
        }
        return !memberMapper.existsByUserId(userId.trim());
    }

    @Override
    public void registerMember(
            String gender, String positionName, String businessName, String managerName,
            String userName, String userId, String userPwd, String email, String birthday,
            String phone, String address, MultipartFile profileImage) throws IOException {

        // 입력값 검증
        validateInput(gender, positionName, businessName, managerName, userName, userId, userPwd, email, birthday, phone, address);

        Member member = new Member();
        member.setGender(gender.trim());
        member.setPositionName(positionName.trim());
        member.setBusinessName(businessName.trim());
        member.setManagerName(managerName.trim());
        member.setUserName(userName.trim());
        member.setUserId(userId.trim());
        member.setUserPwd(passwordEncoder.encode(userPwd)); // 비밀번호 암호화
        member.setEmail(email.trim());
        member.setBirthday(java.sql.Date.valueOf(birthday));
        member.setPhone(phone.trim());
        member.setAddress(address.trim());
        member.setEnrollDate(new Timestamp(System.currentTimeMillis()));

        // 프로필 이미지 처리
        if (profileImage != null && !profileImage.isEmpty()) {
            String fileName = processProfileImage(profileImage);
            member.setImageOriginPath(profileImage.getOriginalFilename());
            member.setImageChangePath("/resources/uploadfile/" + fileName);
        }

        memberMapper.insertMember(member);
    }

    private void validateInput(String... inputs) {
        for (String input : inputs) {
            if (input == null || input.trim().isEmpty()) {
                throw new IllegalArgumentException("모든 필수 입력값을 입력해주세요.");
            }
        }
    }

    private String processProfileImage(MultipartFile profileImage) throws IOException {
        String originalFilename = StringUtils.cleanPath(profileImage.getOriginalFilename());
        String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));

        // 허용된 파일 확장자 검증
        if (!isValidImageExtension(fileExtension)) {
            throw new IllegalArgumentException("지원하지 않는 이미지 형식입니다.");
        }

        String fileName = UUID.randomUUID().toString() + fileExtension;
        Path uploadDir = Paths.get("src/main/resources/uploadfile");
        Files.createDirectories(uploadDir);

        Path filePath = uploadDir.resolve(fileName);
        Files.copy(profileImage.getInputStream(), filePath);

        return fileName;
    }

    private boolean isValidImageExtension(String extension) {
        String[] allowedExtensions = {".jpg", ".jpeg", ".png", ".gif"};
        for (String allowed : allowedExtensions) {
            if (allowed.equalsIgnoreCase(extension)) {
                return true;
            }
        }
        return false;
    }
}