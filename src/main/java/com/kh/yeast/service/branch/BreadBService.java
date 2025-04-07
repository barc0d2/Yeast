package com.kh.yeast.service.branch;

import com.kh.yeast.domain.entity.Bread;
import com.kh.yeast.domain.entity.PageInfo;

import java.util.ArrayList;

public interface BreadBService {
    Integer selectBreadCount() throws Exception;
    ArrayList<Bread> selectBreadList(PageInfo pi) throws Exception;
}
