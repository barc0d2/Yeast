package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Sell;
import com.kh.yeast.mappers.company.FinanceCMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class FinanceCServiceImpl implements FinanceCService {

    private final FinanceCMapper financeCMapper;

    @Override
    public ArrayList<Sell> selectRecentlySellList() {
        return financeCMapper.selectRecentlySellList();
    }

    @Override
    @Transactional
    public Model selectSellList(Long businessNo, Integer cpage,String period, Model model) {

        Integer sellCount = financeCMapper.selectSellCount(businessNo, period);

        PageInfo pi = new PageInfo(sellCount, cpage, 10, 15);
        int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        ArrayList<Sell> sellList = financeCMapper.selectSellList(businessNo, period, rowBounds);
        sellList.forEach(sell -> {
            Timestamp createDate = sell.getCreateDate();
            if (createDate != null) {
                Date sqlDate = new Date(createDate.getTime());
                sell.setEnrollDate(sqlDate);
            } else {
                sell.setEnrollDate(null);
            }
        });

        RowBounds rowBusinessBounds = new RowBounds(1, Integer.MAX_VALUE);
        ArrayList<Business> businessList = financeCMapper.selectBusinessList(rowBusinessBounds);

        model.addAttribute("sellList", sellList);
        model.addAttribute("businessList", businessList);
        model.addAttribute("pi", pi);
        model.addAttribute("currentName", "재무관리");
        model.addAttribute("smallCurrentName","도매 매출");

        if(businessList.isEmpty()){
            model.addAttribute("errorMsg", "페이지를 불러오지 못했습니다");
        }

        if(sellList.isEmpty()){
            model.addAttribute("alertMsg", "도매 매출 데이터 불러오지 못했습니다.");
        }
        return model;
    }
}
