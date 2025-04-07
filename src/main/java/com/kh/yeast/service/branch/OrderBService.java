package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.PageInfo;
import com.kh.yeast.domain.vo.Supply;

import java.util.ArrayList;
import java.util.List;

public interface OrderBService {

   int selectOrderCount();

   List<Supply> modalOpen();

   ArrayList<Supply> selectOrderList(PageInfo pi);
}
