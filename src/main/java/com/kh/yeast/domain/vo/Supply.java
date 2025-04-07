package com.kh.yeast.domain.vo;

import lombok.*;

import java.sql.Date;
import java.sql.Timestamp;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode
public class Supply {
    private Long supplyNo;
    private Long breadNo;
    private Long branchNo;
    private Long companyNo;
    private Integer quantity;
    private Integer status;
    private Date orderDate;
    private Timestamp createDate;
    private Timestamp updateAt;
    private String separate;
    private String client;
    private String manager;
}
