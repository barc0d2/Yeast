package com.kh.yeast.domain.vo;

import lombok.*;

import java.sql.Date;
import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Bread {
    private Long breadNo;
    private Timestamp createDate;
    private String breadName;
    private Integer categoryNo;
    private String categoryName;
    private Integer price;
    private String breadContent;
    private Integer calories;
    private String allergy;
    private String imageOrigin;
    private String imageChange;
    private Date enrollDate;
    private Integer status;
}
