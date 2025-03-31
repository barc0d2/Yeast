package com.kh.yeast.domain.vo;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "BUSINESS")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SequenceGenerator(
        name = "BUSINESS_SEQ_GENERATOR",
        sequenceName = "SEQ_BUSINESS",
        allocationSize = 1
)
public class Business {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "BUSINESS_SEQ_GENERATOR")
    @Column(name = "BUSINESS_NO")
    private Long businessNo;

    @Column(name = "BUSINESS_NAME", nullable = false, length = 50)
    private String businessName;
}
