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
    private Long userNo;

    private String businessName;

    private Integer businessNo;

    private String positionName;

    private Integer positionNo;

    private String managerName;

    @Transient
    private String headName;

    private String userName;

    private String userId;

    private String password;

    private String email;

    @Getter
    @Setter
    private Integer salary;

    private Double bonus;

    private String phone;

    private String gender;

    private String address;

    private LocalDate enrollDate;

    private String imageChangePath;

    private String imageOriginPath;

    private LocalDate birthday;

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
                ", positionName='" + positionName + '\'' +
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
