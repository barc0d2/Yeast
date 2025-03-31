package com.kh.yeast.domain.vo;

import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Date;
import java.sql.Timestamp;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {

    private Long userNo;
    private String businessName;
    private String positionName;
    private String managerName;
    private String userName;
    private String userId;
    private String userPwd;
    private String email;
    private int salary;
    private int bonus;
    private String phone;
    private String gender;
    private String address;
    private Timestamp enrollDate;
    private String imageChangePath;
    private String imageOriginPath;
    private Date birthday;

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }
}
