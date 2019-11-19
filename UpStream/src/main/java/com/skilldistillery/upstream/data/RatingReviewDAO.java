package com.skilldistillery.upstream.data;

import java.util.List;

import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.RatingReview;

public interface RatingReviewDAO  {
	public RatingReview createReview(RatingReview rating);
	public boolean deleteReview(int id);
	public List<RatingReview> getTopRatedByContentId(int idIn);
	public RatingReview getRatingById(int revId);
	public RatingReview updateReview(int revId, RatingReview review);
	List<RatingReview> getRatingByUserId(int userId, int contentId);
	List<Double> getAverageRating(int contentId);
	List<Double> getAverageRatingList();
	List<Content> getService(int servId);
}
