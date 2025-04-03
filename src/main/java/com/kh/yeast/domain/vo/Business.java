package com.kh.yeast.domain.vo;

import lombok.*;

import java.sql.Date;

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
    private Date createTime;
    private String imageChange;
    private String imageOrigin;
}

