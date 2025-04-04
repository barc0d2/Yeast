package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.mappers.company.FinanceCMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class FinanceCServiceImpl implements FinanceCService {

    private final FinanceCMapper financeCMapper;

    @Override
    public ArrayList<Sell> selectSellList() {
        return financeCMapper.selectSellList();
    }
}
