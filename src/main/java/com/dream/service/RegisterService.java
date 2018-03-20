package com.dream.service;

import com.dream.po.Browse;
import com.dream.po.User;
import com.dream.common.E3Result;

/**
 * Created by ZXL on 2018/3/1.
 */
public interface RegisterService {
    public E3Result checkData(String param, int type);
    public E3Result register(User user);
    public void selectFavorite(Browse browse);

}
