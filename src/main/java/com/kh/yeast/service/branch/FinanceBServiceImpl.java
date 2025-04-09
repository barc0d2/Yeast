package com.kh.yeast.service.branch;

import com.kh.yeast.customException.PaymentTransactionException;
import com.kh.yeast.domain.vo.BreadInventory;
import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.mappers.branch.FinanceBMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.jdbc.Null;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class FinanceBServiceImpl implements FinanceBService {

    private final FinanceBMapper financeBMapper;

    @Override
    public ArrayList<BreadInventory> dailyBreadList(String businessName) {
        return financeBMapper.inventoryList(businessName);
    }

    @Override
    @Transactional
    public String insertSell(Sell sell) {
        Long businessNo  = sell.getBusinessNo();
        Integer money = sell.getSellMoney();

        ArrayList<Business> businesses = financeBMapper.selectBusinessUpdate(businessNo);
        Timestamp updateAt = businesses.get(0).getUpdateAt();

        ArrayList<Sell> sellList = financeBMapper.selectTodaySell(businessNo);
        if(!sellList.isEmpty()){
            return "오늘 매출 내역이 이미 저장되었습니다.";
        }

        Integer result1 = financeBMapper.insertSell(sell);
        if(result1==0){
            throw new PaymentTransactionException("하루 매출 내역이 저장되지 않았습니다.");
        }

        Integer result2 = financeBMapper.updateMoney(money, businessNo, updateAt);
        if(result2==0){
            throw new PaymentTransactionException("가맹점에 입금 실패");
        }

        return "저장 성공!!";
    }
}
