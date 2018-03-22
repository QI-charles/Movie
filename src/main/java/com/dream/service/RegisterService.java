package com.dream.service;
import org.springframework.web.bind.annotation.PathVariable;
import com.dream.po.Browse;
import com.dream.po.User;
import com.dream.common.E3Result;

/**
 * Created by ZXL on 2018/3/1.
 */
public interface RegisterService {
    public E3Result checkData(String param, int type);
    public E3Result register(User user);
    public void selectFavorite(Browse browse);//注册时候写入
    E3Result checkDataBoth(@PathVariable String paramName, @PathVariable String paramEmail, @PathVariable Integer type);

}
