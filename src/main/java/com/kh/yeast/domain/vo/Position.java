package com.kh.yeast.domain.vo;

import lombok.*;

import java.sql.Timestamp;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode
public class Position {
    private Long positionNo;
    private String positionName;
    private Timestamp createTime;
    private Integer role;
} 