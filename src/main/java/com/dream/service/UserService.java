package com.dream.service;

import com.dream.po.User;

public interface UserService {

    // 编辑用户
    public User getUserById(Integer id);

    // 更新用户信息
    public void updateUser(Integer userid, String password);
}
