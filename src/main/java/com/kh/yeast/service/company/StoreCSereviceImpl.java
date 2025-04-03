package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Inventory;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.company.StoreCMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicInteger;

@Service
@RequiredArgsConstructor
public class StoreCSereviceImpl implements StoreCService {

    private final StoreCMapper storeCMapper;


    @Override
    public Integer selectStoreCount() {
        return storeCMapper.selectStoreCount();
    }

    @Override
    public ArrayList<Business> selectStoreList(PageInfo pi) {
        int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
        return storeCMapper.selectStoreList(rowBounds);
    }

    @Override
    public Integer dropBread() {
        return storeCMapper.dropBread();
    }
}
