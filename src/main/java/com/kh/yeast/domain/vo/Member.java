package com.kh.yeast.domain.vo;

import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Date;
import java.sql.Timestamp;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode
public class Member {
    private Long userNo;
    private Long businessNo;
    private Long positionNo;
    private Long managerNo;
    private String userName;
    private String userId;
    private String userPwd;
    private String email;
    private Integer salary;
    private Integer bonus;
    private String phone;
    private String gender;
    private String address;
    private Timestamp createDate;
    private String imageChange;
    private String imageOrigin;
    private Date birthday;
    private Date enrollDate;
    private Integer status;
}