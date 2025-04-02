package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.mappers.branch.BreadBMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class BreadBServiceImpl implements BreadBService {
    private final BreadBMapper breadBMapper;

    @Override
    public Integer selectBreadCount() {
        return breadBMapper.selectBreadCount();
    }

    @Override
    public ArrayList<Bread> selectBreadList(PageInfo pi) {
        Integer offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        ArrayList<Bread> breadList = breadBMapper.selectBreadList(rowBounds);

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
}
