package com.kh.yeast.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BreadInventory {
    private Long breadNo;
    private String breadName;
    private String categoryName;
    private Integer price;
    private Integer invenCount;
}
