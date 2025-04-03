package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.BreadCategory;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.company.BreadCMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class BreadCServiceImpl implements BreadCService {
    private final BreadCMapper breadCMapper;

    @Override
    public Integer selectBreadCount(){
        return breadCMapper.selectBreadCount();
    }

    @Override
    public ArrayList<Bread> selectBreadList(PageInfo pi){
        Integer offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        ArrayList<Bread> breadList = breadCMapper.selectBreadList(rowBounds);
        System.out.println("size2"+breadList.size());
        breadList.forEach(bread -> {
            Timestamp createDate = bread.getCreateDate();
            if (createDate != null) {
                Date sqlDate = new Date(createDate.getTime());
                bread.setEnrollDate(sqlDate);
            } else {
                bread.setEnrollDate(null);
            }
        });

        return breadList;
    }

    @Override
    public Integer insertBread(Bread bread){
        return breadCMapper.insertBread(bread);
    }

    @Override
    @Transactional
    public Integer updateBread(Bread bread){
        int result1 = breadCMapper.updateBread(bread);
        int result2 = breadCMapper.updateBreadDetail(bread);
        return result1*result2;
    }

    @Override
    public ArrayList<BreadCategory> selectBreadCategories() {
        return breadCMapper.selectBreadCategories();
    }

    @Override
    public Bread selectBread(Integer breadNo) throws Exception {
        return breadCMapper.selectBread(breadNo);
    }

    @Override
    @Transactional
    public Integer deleteBread(Long breadNo) throws Exception {
        return breadCMapper.deleteBread(breadNo);
    }
}
