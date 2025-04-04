package com.kh.yeast.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Inventory {
    private Long inventoryNo;
    private Long breadNo;
    private Integer invenCount;
    private Long businessNo;
    private String businessName;
    private String breadName;
    private Timestamp createTime;
    private Date enrollDate;
}
