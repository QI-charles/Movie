package com.dream.controller;

import com.dream.common.E3Result;
import com.dream.po.Category;
import com.dream.po.User;
import com.dream.service.LoginService;
import com.dream.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by ZXL on 2018/3/1.
 */

@Controller
public class CustomerController {

    @Autowired
    private RegisterService registerService;

    @Autowired
    private LoginService loginService;


    @RequestMapping("/page/register")
    public String reg() {

        return "register";
    }

    @RequestMapping("/page/login")
    public String log() {

        return "login";
    }

    @RequestMapping("/customer/check/{param}/{type}")
    @ResponseBody
    public E3Result checkData(@PathVariable String param, @PathVariable Integer type) {
        E3Result e3Result = registerService.checkData(param, type);
        return e3Result;
    }

    @RequestMapping(value = "/customer/register", method = RequestMethod.POST)
    @ResponseBody
    public E3Result register(User user) {
        E3Result e3Result = registerService.register(user);
        return e3Result;
    }

    @RequestMapping(value = "/customer/login", method = RequestMethod.POST)
    @ResponseBody
    public E3Result login(String username, String password, Model model, HttpServletRequest request) {
        E3Result e3Result = loginService.userLogin(username, password);
        User user = null;
        // 判断是否登录成功
        if (e3Result.getStatus() == 200) {
            user = (User) e3Result.getData();
        }
        request.getSession().setAttribute("user", user);
        // 返回结果
        return e3Result;
    }

    //用户退出
    @RequestMapping("/page/logout")
    public String pagelogout( HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return "Home";
    }

}
