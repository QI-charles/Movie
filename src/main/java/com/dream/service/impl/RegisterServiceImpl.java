package com.dream.service.impl;

import com.dream.common.E3Result;
import com.dream.mapper.BrowseMapper;
import com.dream.mapper.UserMapper;
import com.dream.po.Browse;
import com.dream.po.User;
import com.dream.po.UserExample;
import com.dream.service.RegisterService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.List;

/**
 * Created by ZXL on 2018/3/1.
 */

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private BrowseMapper browseMapper;

    @Override
    public E3Result checkData(String param, int type) {
        // 根据不同的type生成不同的查询条件
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        // 1：用户名 2：手机号 3：邮箱
        if (type == 1) {
            criteria.andUsernameEqualTo(param);
        }
        else if (type == 3){
            criteria.andEmailEqualTo(param);
        }
        else{
            return E3Result.build(400, "数据类型错误");
        }
        // 执行查询
        List<User> list = userMapper.selectByExample(example);
        // 判断结果中是否包含数据
        if (list != null && list.size() > 0) {
            // 如果有数据返回false
            return E3Result.ok(false);
        }
        // 如果没有数据返回true
        return E3Result.ok(true);
    }

    @Override
    public E3Result register(User user) {
        // 数据有效性校验
        if (StringUtils.isBlank(user.getUsername()) || StringUtils.isBlank(user.getPassword())|| StringUtils.isBlank(user.getEmail())) {
            return E3Result.build(400, "用户数据不完整，注册失败");
        }
        // 补全pojo的属性
        user.setRegistertime(new Date());
        user.setLastlogintime(new Date());
        // 对密码进行md5加密
        String md5Pass = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
        user.setPassword(md5Pass);
        // 把用户数据插入到数据库中
        userMapper.insert(user);//新增3.18
        Integer userId = user.getUserid();
        // 返回添加成功
        return E3Result.ok(userId);
    }

    @Override
    public void selectFavorite(Browse browse){
        browseMapper.insert(browse);
    }


}
