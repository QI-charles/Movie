package com.dream.controller;

import com.dream.common.E3Result;
import com.dream.po.Category;
import com.dream.po.Selectquery;
import com.dream.service.CategoryService;
import com.dream.po.Movie;
import com.dream.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.lang.String;

/**
 * Created by ZXL on 2018/3/1.
 */

@Controller
public class IndexController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private MovieService movieService;
    //主页
    @RequestMapping("/")
    public String showIndex( HttpServletRequest request){
        //获取所有分类标签
        E3Result e3ResultAllCategory = categoryService.GetAllCategory();
        List<Category> list1 = (List<Category>)e3ResultAllCategory.getData();
        //获取所有电影数据(缺少筛选，默认一次加载20个)
        E3Result e3ResultAllMoive = movieService.GetAllMoive() ;
        List<Movie> list2 = (List<Movie>)e3ResultAllMoive.getData();
        list2 =list2.subList(0,20);
        //设置SEESION
        request.getSession().setAttribute("category",list1);
        request.getSession().setAttribute("movie",list2);
        return "index";
    }

    //电影详情传值
    @RequestMapping("/Customer/Description")
    @ResponseBody
    public E3Result GoMoiveDescription(HttpServletRequest request) {
        //获取用户点击的movieid
        int  movieid=Integer.parseInt(request.getParameter("id"));
        E3Result e3Result = movieService.SortMoiveByMovieid(movieid);
        Movie movie = (Movie) e3Result.getData();
        System.out.print(movie.getMoviename());
        //设置session
        request.getSession().setAttribute("moviedescription",movie);
        return e3Result;
    }

    //电影详情
    @RequestMapping("/MovieDescription")
    public String showMoiveDescription(HttpServletRequest request){
        return "MovieDescription";
    }

    //加载更多
    @RequestMapping(value = "/loadingmore", method = RequestMethod.POST)
    @ResponseBody
    public E3Result showloadmore(HttpServletRequest request){
        int categoryid= Integer.parseInt(request.getParameter("type"));
        int molimit=Integer.parseInt(request.getParameter("molimit"));
        System.out.print("测试"+categoryid);
        Selectquery query=new Selectquery();
        query.setCategoryid(categoryid);
        query.setmolimit(molimit);
        E3Result e3ResultAllMoive = movieService.SortMoiveBycategory(query);
        List<Movie> list = (List<Movie>)e3ResultAllMoive.getData();
        E3Result e3Result=E3Result.ok(list);
        return e3Result;
    }

    //选择排序电影
    @RequestMapping(value = "/typesortmovie", method = RequestMethod.POST)
    @ResponseBody
    public E3Result showtypesortmovie(HttpServletRequest request){
        int type= Integer.parseInt(request.getParameter("type"));
        Selectquery query=new Selectquery();
        query.setCategoryid(type);
        query.setmolimit(0);

        E3Result e3ResultAllMoive = movieService.SortMoiveBycategory(query) ;
        List<Movie> list = (List<Movie>)e3ResultAllMoive.getData();
        E3Result e3Result=E3Result.ok(list);
        return e3Result;
    }
}

