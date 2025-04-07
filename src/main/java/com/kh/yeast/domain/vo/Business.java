package com.kh.yeast.domain.vo;

import lombok.*;

import java.sql.Timestamp;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode

public class Business {
    private Long businessNo;
    private String businessName;
    private String phone;
    private String location;
    private Integer money;
    private Timestamp createTime;
    private Integer status;
    private String imageChange;
    private String imageOrigin;
    private Timestamp updateAt;
}

