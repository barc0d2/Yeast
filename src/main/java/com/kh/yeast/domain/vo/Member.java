package com.kh.yeast.domain.vo;

import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Timestamp;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {

    private Long userNo;
    private Long businessNo;
    private Long positionNo;
    private Long mangerNo;
    private String userName;
    private String userId;
    private String userPwd;
    private String email;
    private int salary;
    private int bonus;
    private String phone;
    private String gender;
    private String address;
    private Timestamp createDate;
    private String imageChangePath;
    private String imageOriginPath;

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }
}
