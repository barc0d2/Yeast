package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Supply;
import com.kh.yeast.mappers.SupplyMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class OrderBServiceImpl implements OrderBService {

    private final SupplyMapper supplyMapper;

    @Override
    public int selectOrderCount(long businessNo) {
        return supplyMapper.selectOrderCount(businessNo);
    }

    @Override
    public ArrayList<Supply> selectValue() {
        return supplyMapper.selectValue();
    }

    @Override
    public ArrayList<Supply> selectOrderList(long businessNo, PageInfo pi) {
        int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
        return supplyMapper.selectOrderList(businessNo, rowBounds);
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

    @Override
    @Scheduled(cron = "0 0 22 * * ?")
    public int night() {
        return supplyMapper.night();
    }

    @Override
    public ArrayList<Supply> selectUpdate(int supplyNo) {
        return supplyMapper.selectUpdate(supplyNo);
    }

    @Override
    public Supply selectUpdateInfo(int supplyNo) {
        return supplyMapper.selectUpdateInfo(supplyNo);
    }

    @Override
    public int deleteList(long supplyNo) {
        return supplyMapper.deleteList(supplyNo);
    }

    @Override
    public int businessMoney(long businessNo) {
        return supplyMapper.businessMoney(businessNo);
    }

    @Override
    public int updateBusinessMoney(long businessNo, int totalSumPrice) {
        return supplyMapper.updateBusinessMoney(businessNo, totalSumPrice);
    }

    @Override
    public int updateMoney(long businessNo,long totalPrice) {
        return supplyMapper.updateMoney(businessNo, totalPrice);
    }


}
