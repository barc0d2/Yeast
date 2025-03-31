package com.kh.yeast.domain.vo;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "POSITION")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SequenceGenerator(
        name = "POSITION_SEQ_GENERATOR",
        sequenceName = "SEQ_POSITION",
        allocationSize = 1
)
public class Position {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "POSITION_SEQ_GENERATOR")
    @Column(name = "POSITION_NO")
    private Long positionNo;

    @Column(name = "POSITION_NAME", nullable = false, length = 50)
    private String positionName;

    @Column(name = "BUSINESS_NO", nullable = false)
    private Long businessNo;  // 부서와의 연관을 나타냄
}
