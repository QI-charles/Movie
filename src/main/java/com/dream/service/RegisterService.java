package com.dream.service;

import com.dream.common.E3Result;
import com.dream.po.User;

/**
 * Created by ZXL on 2018/3/1.
 */
public interface RegisterService {
    public E3Result checkData(String param, int type);
    public E3Result register(User user);

}
