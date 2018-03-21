package com.dream.service;

import com.dream.po.Review;

import java.util.List;

public interface ReviewService {

    List<Review> getReviewListByUserId(Integer id);
}
