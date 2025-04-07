package com.kh.yeast.domain.entity;

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
    private String imageChange;
    private String imageOrigin;
    private Date enrollDate;
    private Integer status;
}
