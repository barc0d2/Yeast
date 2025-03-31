package com.kh.yeast.domain.vo;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "MEMBER")
@Getter
@NoArgsConstructor
@SequenceGenerator(
        name = "MEMBER_SEQ_GENERATOR",
        sequenceName = "SEQ_MEMBER",
        allocationSize = 1
)
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEMBER_SEQ_GENERATOR")
    @Column(name = "USER_NO")
    private Long userNo;

    @Column(name = "USER_ID", nullable = false, unique = true, length = 30)
    private String userId;

    @Column(name = "USER_PWD", nullable = false, length = 100)
    private String userPwd;

    @Column(name = "USER_NAME", nullable = false, length = 50)
    private String userName;

    @Column(name = "EMAIL", unique = true, length = 50)
    private String email;

    @Column(name = "PHONE", nullable = false, length = 20)
    private String phone;

    @Column(name = "GENDER", nullable = false, length = 1)
    private String gender;

    @Column(name = "ADDRESS", nullable = false, length = 100)
    private String address;

    @Column(name = "POSITION_NO", nullable = false)
    private Long positionNo;

    @Column(name = "BUSINESS_NO", nullable = false)
    private Long businessNo;

    @Column(name = "MANAGER_NO")
    private Long managerNo;

    @Column(name = "SALARY")
    private Integer salary;

    @Column(name = "BONUS")
    private Integer bonus;

    @Column(name = "IMAGE_CHANGEPATH", length = 100)
    private String imageChangePath;

    @Column(name = "IMAGE_ORIGINPATH", length = 100)
    private String imageOriginPath;

    @Column(name = "BIRTHDAY")
    private LocalDate birthday;

    @Column(name = "CREATE_DATE", nullable = false)
    private LocalDateTime createDate = LocalDateTime.now();

    @Column(name = "STATUS", nullable = false)
    private Integer status = 1;

    public Member(String userId, String userPwd, String userName, String phone, String gender, String address, Long positionNo, Long businessNo) {
        this.userId = userId;
        this.userPwd = userPwd;
        this.userName = userName;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.positionNo = positionNo;
        this.businessNo = businessNo;
    }
}
