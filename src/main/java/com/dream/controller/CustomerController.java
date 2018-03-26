package com.dream.controller;
import com.dream.po.Movie;
import com.dream.po.Selectquery;
import com.dream.po.User;
import com.dream.po.Browse;
import com.dream.common.E3Result;
import com.dream.service.LoginService;
import com.dream.service.TopDefaultMoviesService;
import com.dream.service.UserService;
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
    private UserService userService;
    @Autowired
    private RegisterService registerService;

    @Autowired
    private LoginService loginService;
    @Autowired
    private TopDefaultMoviesService topDefaultMoviesService;


    @RequestMapping("/page/register")
    public String reg(HttpServletRequest request) {

        List<Movie> list = topDefaultMoviesService.SelectRegDefaultMovie();
        request.getSession().setAttribute("TopRegDefaultMovie",list);

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
    public E3Result register(User user,HttpServletRequest request) {
        //修改3.18 返回用户id
        Integer userId = 0;
        E3Result e3Result = registerService.register(user);
        if (e3Result.getStatus() == 200) {
            userId = (Integer) e3Result.getData();
        }
        request.getSession().setAttribute("userId", userId);
        return e3Result;
    }

    //新用户选择喜欢的电影
    @RequestMapping(value = "/customer/register/movieSubmit",method = RequestMethod.POST)
    @ResponseBody
    public String  selectedMovie(String ids ,HttpServletRequest request){
        System.out.print(request.getParameter("ids"));

        if(ids== "" || ids==null){
            System.out.print("为空");
        }
        else {
            System.out.print(ids);
        }

        //获取的用户id
        Integer userId = (Integer) request.getSession().getAttribute("userId");
       /* //获取点击的时间戳
        String str = request.getParameter("time");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date time = format.parse(str);
*/
        Browse browse = new Browse();
        //存用户名
        browse.setUserid(userId);
        browse.setmovieids(ids);

        registerService.selectFavorite(browse);

        return "ok";
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


    @RequestMapping("/customer/checkboth/{paramName}/{paramEmail}/{type}")
    @ResponseBody
    public E3Result checkDataBoth(@PathVariable String paramName,@PathVariable String paramEmail, @PathVariable Integer type) {
        E3Result e3Result = registerService.checkDataBoth(paramName,paramEmail,type);
        return e3Result;
    }


    // 更新用户密码
    @RequestMapping("/user/update")
    @ResponseBody
    public String updateUser(HttpServletRequest request) {
        String useridstr = request.getParameter("userid");
        String password = request.getParameter("password");
        Integer userid = Integer.parseInt(useridstr);
        // 修改密码
        userService.updateUser(userid, password);
        return "OK";
    }
}
