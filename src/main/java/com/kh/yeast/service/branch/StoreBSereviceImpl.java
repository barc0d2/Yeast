package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.branch.StoreBMapper;
import com.kh.yeast.mappers.company.StoreCMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class StoreBSereviceImpl implements StoreBService {

    private final StoreBMapper storeBMapper;

    @Override
    public Business selectStore(long businessNo) {
        return storeBMapper.selectStore(businessNo);
    }

    @Override
    public Integer updateThings(Business business){
        int result= storeBMapper.updateThings(business);
        return result;
    }
}
