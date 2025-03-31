package com.kh.yeast.repository;

import com.kh.yeast.domain.vo.Business;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BusinessRepository extends JpaRepository<Business, Long> {

    Business findByBusinessNo(Long businessNo);
}
