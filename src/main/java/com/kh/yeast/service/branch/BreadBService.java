package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Bread;
import com.kh.yeast.domain.vo.PageInfo;

import java.util.ArrayList;

public interface BreadBService {
    Integer selectBreadCount() throws Exception;
    ArrayList<Bread> selectBreadList(PageInfo pi) throws Exception;
}
