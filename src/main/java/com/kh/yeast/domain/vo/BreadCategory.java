package com.kh.yeast.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BreadCategory {
    private Integer categoryNo;
    private String categoryName;
}
