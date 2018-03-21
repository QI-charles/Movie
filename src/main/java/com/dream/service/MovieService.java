package com.dream.service;
import com.dream.common.E3Result;
import com.dream.po.Selectquery;
public interface MovieService {
    E3Result SelectTopDefaultMovie();
    E3Result SortMoiveBycategory(Selectquery query);
    E3Result SortMoiveByMovieid(int id);
    E3Result Select5SimilarMoviesById(int id);
    int booluserunlikedmovie(int userid,String movieid);
    void InsertUserFavouriteMoive(Selectquery selectquery);//用户收藏电影
}
