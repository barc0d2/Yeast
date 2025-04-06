package com.kh.yeast.domain.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "member")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Setter
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userNo;

    @Column(nullable = false, unique = true)
    private String userId;

    @Column(nullable = false)
    private String userPwd;

    @Column(nullable = false)
    private String userName;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String phone;

    @Column(nullable = false)
    private String gender;  // gender 필드가 존재

    @Column(nullable = false)
    private String address;

    private Long positionNo;
    private Long businessNo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "manager_no")
    private Member manager;

    @Column(nullable = false)
    private Integer salary;

    @Column(nullable = false)
    private Integer bonus;

    private String imageChangePath;
    private String imageOriginPath;

    @Column(nullable = false)
    private LocalDate birthday;

    @Column(name = "create_date", updatable = false)
    private LocalDateTime createDate = LocalDateTime.now();

    @Column(nullable = false)
    private Integer status = 1;

    @Setter
    private String position;  // 직급명

    @Setter
    private String business;  // 사업명

    // 기존 getter 메소드 추가
    public String getPosition() {
        return position != null ? position : "";  // 직급명 반환
    }

    public String getBusiness() {
        return business != null ? business : "";  // 사업명 반환
    }

    public String getGender() {
        return gender != null ? gender : "";  // gender 반환
    }

    public String getManagerName() {
        return manager != null ? manager.getUserName() : "없음";
    }

    public Long getManagerNo() {
        return manager != null ? manager.getUserNo() : null;
    }

    public String getName() {
        return userName;
    }

    public LocalDate getBirthdate() {
        return birthday;
    }

    public Long getPositionNo() {
        return positionNo;
    }

    public Long getBusinessNo() {
        return businessNo;
    }

    public void updateSalary(Integer salary) {
        this.salary = salary;
    }

    public void updateBonus(Integer bonus) {
        this.bonus = bonus;
    }

    public void updatePosition(Long positionNo) {
        this.positionNo = positionNo;
    }

    public void updateStatus(Integer status) {
        this.status = status;
    }
}
