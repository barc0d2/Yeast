package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Supply;
import com.kh.yeast.mappers.SupplyMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class DispatchCServiceImpl implements DispatchCService{

    private final SupplyMapper supplyMapper;

    @Override
    public int selectDispatchCount() {
        return supplyMapper.selectDispatchCount();
    }

    @Override
    public ArrayList<Supply> selectDispatchList(PageInfo pi) {
        int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
        ArrayList<Supply> list =supplyMapper.selectDispatchList(rowBounds);
        System.out.println(list);
        return list;

    }
}
