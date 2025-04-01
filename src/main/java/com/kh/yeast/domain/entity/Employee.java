package com.kh.yeast.domain.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "MEMBER")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Setter
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "USER_NO")
    private Long userNo;

    @Column(name = "BUSINESS_NAME", nullable = false, length = 100)
    private String businessName;

    @Column(name = "POSITION_NAME", length = 50)
    private String position;

    @Column(name = "MANAGER_NAME", length = 50)
    private String managerName;

    @Column(name = "USER_NAME", nullable = false, length = 50)
    private String name;

    @Column(name = "USER_ID", nullable = false, unique = true, length = 50)
    private String userId;

    @Column(name = "USER_PWD", nullable = false, length = 255)
    private String password;

    @Column(name = "EMAIL", unique = true, length = 100)
    private String email;

    @Column(name = "SALARY")
    private Integer salary;

    @Column(name = "BONUS")
    private Double bonus;

    @Column(name = "PHONE", length = 20)
    private String phone;

    @Column(name = "GENDER", length = 10)
    private String gender;

    @Column(name = "ADDRESS", length = 255)
    private String address;

    @Column(name = "CREATE_DATE", nullable = false)
    private LocalDate enrollDate;

    @Column(name = "IMAGE_CHANGEPATH", length = 255)
    private String imageChangePath;

    @Column(name = "IMAGE_ORIGINPATH", length = 255)
    private String imageOriginPath;

    @Column(name = "BIRTHDAY")
    private LocalDate birthday;

    @Column(name = "STATUS", length = 10)
    private String status;

    public void updateSalary(Integer salary) {
        this.salary = salary;
    }

    public void updateBonus(Double bonus) {
        this.bonus = bonus;
    }

    public void updatePosition(String position) {
        this.position = position;
    }

    public void updateStatus(String status) {
        this.status = status;
    }
}
