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
    private String branchName;
    private Long branchNo;
    private Long companyNo;
    private Integer quantity;
    private String status;
    private Date orderDate;
    private Timestamp createDate;
    private Timestamp updateAt;
    private String separate;
    private String categoryName;
    private String breadName;
    private Integer price;
    private Integer invenCount;
    private String manager;
    private String client;
}
