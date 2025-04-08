package com.kh.yeast.domain.vo;

import lombok.*;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode
public class SupplyDetail {
    private Long supplyNo;
    private String breadName;
    private Integer quantity;
}
