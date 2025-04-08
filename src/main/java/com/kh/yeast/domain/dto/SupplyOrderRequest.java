package com.kh.yeast.domain.dto;

import lombok.*;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SupplyOrderRequest {
    private String purchaser;
    private String dueDate; // "yyyy-MM-dd"
    private List<BreadOrderDetail> orderList;
}