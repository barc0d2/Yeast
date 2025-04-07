package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.BreadCategory;
import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.entity.Bread;
import com.kh.yeast.domain.entity.PageInfo;

import java.util.ArrayList;

public interface BreadCService {
    Integer selectBreadCount() throws Exception;
    ArrayList<Bread> selectBreadList(PageInfo pi) throws Exception;
    Integer insertBread(Bread bread) throws Exception;
    Integer updateBread(Bread bread) throws Exception;
    ArrayList<BreadCategory> selectBreadCategories() throws Exception;
    Bread selectBread(Integer breadNo) throws Exception;
    Integer deleteBread(Long breadNo) throws Exception;
}
