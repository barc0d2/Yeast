package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.*;
import com.kh.yeast.mappers.company.FinanceCMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicReference;

@Service
@RequiredArgsConstructor
public class FinanceCServiceImpl implements FinanceCService {

    private final FinanceCMapper financeCMapper;

    @Override
    public Model selectRecentlySellList(Model model,Integer cpage) {
        Integer branchCount = financeCMapper.selectBranchCount();

        PageInfo pi = new PageInfo(branchCount, cpage, 10, 4);
        int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        ArrayList<Sell> list = financeCMapper.selectRecentlySellList(rowBounds);
        if(list.isEmpty()){
            throw new NullPointerException();
        }
        model.addAttribute("pi", pi);
        model.addAttribute("list", list);
        model.addAttribute("currentName", "재무관리");
        model.addAttribute("smallCurrentName","지점점 매출");
        return model;
    }

    @Override
    public Model selectSellList(Long businessNo,Integer cpage, String period, Model model) {

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
        model.addAttribute("smallCurrentName","가맹점 매출");

        if(businessList.isEmpty()){
            model.addAttribute("errorMsg", "페이지를 불러오지 못했습니다");
        }

        if(sellList.isEmpty()){
            model.addAttribute("alertMsg", "회사 매출 데이터 불러오지 못했습니다.");
        }
        return model;
    }

    @Override
    public Model selectRecentlyWholesaleList(Model model, Integer cpage) {
        Integer branchCount = financeCMapper.selectBranchCount();

        PageInfo pi = new PageInfo(branchCount, cpage, 10, 4);
        int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        ArrayList<Business> businessList = financeCMapper.selectBusinessList(rowBounds);

        ArrayList<WholeSale> wholeSaleList = new ArrayList<>();
        AtomicReference<Integer> totalPrice = new AtomicReference<>(0);
        StringBuilder quantitySb = new StringBuilder();
        StringBuilder breadSb = new StringBuilder();
        StringBuilder totalSb = new StringBuilder();

        for(int i=0; i<businessList.size(); i++){
            WholeSale wholeSale = new WholeSale();
            wholeSale.setBusinessName(businessList.get(i).getBusinessName());
            wholeSale.setBusinessNo(businessList.get(i).getBusinessNo());
            ArrayList<Supply> supplyList = financeCMapper.selectRecentlyWholesaleList(businessList.get(i).getBusinessNo());
            if (!supplyList.isEmpty()) {
                wholeSale.setOrderDate(supplyList.get(0).getOrderDate());
            }
            supplyList.forEach(supply -> {
                totalPrice.updateAndGet(v -> v + supply.getPrice());
                if (quantitySb.length() > 0) quantitySb.append(",");
                quantitySb.append(supply.getQuantity());

                if (breadSb.length() > 0) breadSb.append(",");
                breadSb.append(supply.getBreadName());

                if (totalSb.length() > 0) totalSb.append(",");
                totalSb.append(supply.getQuantity());

            });
            wholeSale.setPrice(totalPrice.get());
            wholeSale.setQuantityList(quantitySb.toString());
            wholeSale.setBreadList(breadSb.toString());
            wholeSale.setTotalList(totalSb.toString());
            wholeSaleList.add(wholeSale);
        }

        model.addAttribute("pi", pi);
        model.addAttribute("list", wholeSaleList);
        model.addAttribute("currentName", "재무관리");
        model.addAttribute("smallCurrentName","도매 매출");
        return model;
    }

    @Override
    public Model wholesaleDetail(Long businessNo, Integer cpage, String period, Model model) {
        Integer wholesaleCount = financeCMapper.selectWholesaleCount(businessNo, period);

        PageInfo pi = new PageInfo(wholesaleCount, cpage, 10, 15);
        int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        ArrayList<WholeSale> wholeSaleList = new ArrayList<>();
        AtomicReference<Integer> totalPrice = new AtomicReference<>(0);
        StringBuilder quantitySb = new StringBuilder();
        StringBuilder breadSb = new StringBuilder();
        StringBuilder totalSb = new StringBuilder();

        RowBounds rowBusinessBounds = new RowBounds(1, Integer.MAX_VALUE);
        ArrayList<Business> businessList = financeCMapper.selectBusinessList(rowBusinessBounds);

        Business business = null;
        for(int i=0; i<businessList.size(); i++){
            if(businessList.get(i).getBusinessNo().equals(businessNo)){
                business = businessList.get(i);
            }
        }

        WholeSale wholeSale = new WholeSale();
        wholeSale.setBusinessName(business.getBusinessName());
        wholeSale.setBusinessNo(business.getBusinessNo());
        ArrayList<Supply> supplyList = financeCMapper.selectWholesaleList(business.getBusinessNo(), period, rowBounds);
        if (!supplyList.isEmpty()) {
            wholeSale.setOrderDate(supplyList.get(0).getOrderDate());
            wholeSale.setSupplyNo(supplyList.get(0).getSupplyNo());
        }
        supplyList.forEach(supply -> {
            totalPrice.updateAndGet(v -> v + supply.getPrice());
            if (quantitySb.length() > 0) quantitySb.append(",");
            quantitySb.append(supply.getQuantity());

            if (breadSb.length() > 0) breadSb.append(",");
            breadSb.append(supply.getBreadName());

            if (totalSb.length() > 0) totalSb.append(",");
            totalSb.append(supply.getQuantity());
        });
        wholeSale.setPrice(totalPrice.get());
        wholeSale.setQuantityList(quantitySb.toString());
        wholeSale.setBreadList(breadSb.toString());
        wholeSale.setTotalList(totalSb.toString());
        System.out.println("wholeSale = " + wholeSale);
        wholeSaleList.add(wholeSale);

        model.addAttribute("wholeSaleList", wholeSaleList);
        model.addAttribute("businessList", businessList);
        model.addAttribute("pi", pi);
        model.addAttribute("currentName", "재무관리");
        model.addAttribute("smallCurrentName","도매 매출");

        if(businessList.isEmpty()){
            throw new NullPointerException("회사 목록을 불러오지 못했습니다.");
        }

        if(wholeSaleList.isEmpty()){
            model.addAttribute("alertMsg", "회사 매출 데이터 불러오지 못했습니다.");
        }
        return model;
    }
}
