package com.dream.service;

import com.dream.po.Rectab;

public interface RectabService {
    // 根据用户id获取推荐电影信息
    Rectab getRectabByUserId(Integer userid);
}
