package com.kh.yeast.domain.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "BUSINESS")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
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

    public void setBusinessNo(Long businessNo) {
        this.businessNo = businessNo;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    public void updateBusinessName(String businessName) {
        this.businessName = businessName;
    }
}
