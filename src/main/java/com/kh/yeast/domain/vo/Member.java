package com.kh.yeast.domain.vo;

import lombok.Data;
import java.sql.Timestamp;
import java.sql.Date;

@Data
public class Member {
    private Long userNo;
    private String businessNo;
    private String positionNo;
    private String managerNo;
    private String userName;
    private String userId;
    private String userPwd;
    private String email;
    private String phone;
    private String gender;
    private String address;
    private Timestamp enrollDate;
    private String imageChangePath;
    private String imageOriginPath;
    private Date birthday;
    private String status;
}