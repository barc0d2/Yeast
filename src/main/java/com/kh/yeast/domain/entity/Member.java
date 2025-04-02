package com.kh.yeast.domain.entity;

import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Setter
public class Member {
    private Long userNo;
    private String userId;
    private String userPwd;
    private String userName;
    private String email;
    private String phone;
    private String gender;
    private String address;
    private Long positionNo;
    private Long position;
    private Long businessNo;
    @Getter
    private Long business;
    private Long managerNo;
    private Integer salary;
    private Integer bonus;
    private String imageChangePath;
    private String imageOriginPath;
    private LocalDate birthday;
    private LocalDateTime createDate = LocalDateTime.now();
    private Integer status = 1;

    @Builder
    public Member(String userId, String userPwd, String userName, String email, String phone, String gender, String address, Long positionNo, Long businessNo) {
        this.userId = userId;
        this.userPwd = userPwd;
        this.userName = userName;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.positionNo = positionNo;
        this.businessNo = businessNo;
    }


    public void updateSalary(Integer salary) {
        this.salary = salary;
    }

    public void updateBonus(Integer bonus) {
        this.bonus = bonus;
    }

    public void updatePosition(Long position) {
        this.position = position;
    }

    public void updateStatus(Integer status) {
        this.status = status;
    }


    public String getName() {
        return this.userName;
    }

    public String getManagerName() {
        return managerNo != null ? "사수 이름" : "없음";
    }


    public void setBusiness(Business business) {
        this.business = business.getBusinessNo();
    }
}
