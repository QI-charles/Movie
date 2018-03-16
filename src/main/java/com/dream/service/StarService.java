package com.dream.service;

import com.dream.common.E3Result;
import com.dream.po.Review;

public interface StarService {
    public void  setStar(Review review);
    E3Result SortReviewByUseridandMovieid(Integer userid,Integer movieid);
}
