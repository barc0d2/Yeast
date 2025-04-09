package com.kh.yeast.service.branch;

import com.kh.yeast.domain.vo.Business;
import com.kh.yeast.domain.vo.PageInfo;

import java.util.ArrayList;

public interface StoreBService {

    Business selectStore(int businessNo);
    Integer updateThings(Business business) throws Exception;
}
