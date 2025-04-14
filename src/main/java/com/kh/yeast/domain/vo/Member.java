package com.kh.yeast.domain.vo;

import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode
public class Member {
    private Long userNo;
    private String businessName;
    private Long businessNo;
    private String positionName;
    private Long positionNo;
    private String managerName;
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
    private Timestamp payday;
}