package com.kh.yeast.domain.vo;

import lombok.*;

import java.sql.Date;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode
public class WholeSale {
    private String businessName;
    private Long supplyNo;
    private Long businessNo;
    private Integer price;
    private String quantityList;
    private String breadList;
    private String totalList;
    private Date orderDate;
}
