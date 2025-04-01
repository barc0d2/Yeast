package com.kh.yeast.service.company;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.PageInfo;

import java.util.ArrayList;

public interface BreadCService {
    Integer selectBreadCount();
    ArrayList<Bread> selectBreadList(PageInfo pi);
    Integer insertBread(Bread bread);
    Integer updateBread(Bread bread);
}
