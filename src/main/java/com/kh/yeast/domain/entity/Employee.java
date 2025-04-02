package com.kh.yeast.domain.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
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
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "USER_NO")
    private Long userNo;

    @Column(name = "BUSINESS_NAME", nullable = false, length = 100)
    private String businessName;

    @Column(name = "BUSINESS_NO", nullable = false)  // 🔥 비즈니스 번호 추가
    private Integer businessNo;

    @Column(name = "POSITION_NAME", length = 50)
    private String position;

    @Column(name = "POSITION_NO", nullable = false)
    private Integer positionNo;

    @Column(name = "MANAGER_NAME", length = 50)
    private String managerName;

    @Column(name = "HEAD_NAME", length = 50)
    private String headName;

    @Column(name = "USER_NAME", nullable = false, length = 50)
    private String userName;

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

    @PrePersist
    public void prePersist() {
        if (this.enrollDate == null) {
            this.enrollDate = LocalDate.now();
        }
    }

    @Override
    public String toString() {
        return "Employee{" +
                "userNo=" + userNo +
                ", userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                ", positionNo=" + positionNo +
                ", managerName='" + managerName + '\'' +
                ", headName='" + headName + '\'' +
                ", salary=" + salary +
                ", bonus=" + bonus +
                ", birthday=" + birthday +
                ", enrollDate=" + (enrollDate != null ? enrollDate.toString() : "N/A") +
                ", status=" + status +
                '}';
    }
}
