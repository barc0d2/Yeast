package com.kh.yeast.domain.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BreadOrderDetail {
    private String breadName;
    private String category;
    private Integer quantity;
    private Integer totalPrice;
}
