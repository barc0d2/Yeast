package com.kh.yeast.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
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

}
