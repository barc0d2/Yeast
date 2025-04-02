package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.company.BreadCMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class BreadCServiceImpl implements BreadCService {
    private final BreadCMapper breadCMapper;

    @Override
    public Integer selectBreadCount() {
        return breadCMapper.selectBreadCount();
    }

    @Override
    public ArrayList<Bread> selectBreadList(PageInfo pi) {
        Integer offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return breadCMapper.selectBreadList(rowBounds);
    }

    @Override
    public Integer insertBread(Bread bread) {
        return breadCMapper.insertBread(bread);
    }

    @Override
    @Transactional
    public Integer updateBread(Bread bread) {
        int result1 = breadCMapper.updateBread(bread);
        int result2 = breadCMapper.updateBreadDetail(bread);
        return result1*result2;
    }
}
