package com.kh.yeast.service.company;

import com.kh.yeast.domain.entity.Bread;
import com.kh.yeast.domain.entity.PageInfo;

import java.util.ArrayList;

public interface BreadCService {
    Integer selectBreadCount();
    ArrayList<Bread> selectBreadList(PageInfo pi);
    Integer insertBread(Bread bread);
    Integer updateBread(Bread bread);
}
