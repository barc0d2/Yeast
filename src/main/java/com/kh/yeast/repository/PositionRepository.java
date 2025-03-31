package com.kh.yeast.repository;

import com.kh.yeast.domain.vo.Position;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PositionRepository extends JpaRepository<Position, Long> {

    Position findByPositionNo(Long positionNo);
}
