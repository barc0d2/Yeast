package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Supply;
import com.kh.yeast.domain.vo.SupplyDetail;
import com.kh.yeast.mappers.SupplyMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.sql.Date;
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
    public ArrayList<Supply> selectValue() {
        return supplyMapper.selectValue();
    }

    @Override
    public ArrayList<Supply> selectOrderList(PageInfo pi) {
        int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
        return supplyMapper.selectOrderList(rowBounds);
    }

    @Override
    public int insert(String branchName, Date orderDate) {
        return supplyMapper.insert(branchName, orderDate);
    }

    @Override
    public String insert(Supply supply) {
      int result = supplyMapper.insert(supply);
        if(result==0){
            throw new RuntimeException("저장되지 않았습니다.");
        }
        return "저장완료";
    }

    @Override
    public int insertList(String categoryName, String breadName, String quantityList, String priceList) {
        return supplyMapper.insertList(categoryName,breadName,quantityList,priceList);
    }


}
