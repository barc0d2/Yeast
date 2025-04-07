package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Supply;
import com.kh.yeast.mappers.SupplyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderBServiceImpl implements OrderBService {

    private final SupplyMapper supplyMapper;

    @Override
    public int selectOrderCount() {
        return supplyMapper.selectOrderCount();
    }

    @Override
    public List<Supply> modalOpen() {
        return supplyMapper.modalOpen();
    }

    @Override
    public ArrayList<Supply> selectOrderList(PageInfo pi) {
        return supplyMapper.selectOrderList(pi);
    }
}
