package com.kh.yeast.domain.vo;

import lombok.*;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.sql.Timestamp;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode
public class Sell {
    private Long sellNo;
    private Integer sellMoney;
    private String quantityList;
    private String breadList;
    private String categoryList;
    private Long businessNo;
    private String totalList;
    private Timestamp createDate;
    private Date enrollDate;
    private String businessName;
    private String breadNameList;
}
