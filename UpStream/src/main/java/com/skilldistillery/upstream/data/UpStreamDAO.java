package com.skilldistillery.upstream.data;

import java.util.List;

import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.StreamService;
import com.skilldistillery.upstream.entities.User;

public interface UpStreamDAO {

	public List<Content> getTopContent(int serviceId);

	public List<Content> getFavoritesOfUserById(int idIn);

	public StreamService getService(int id);

	public List<StreamService> getServices();

	public List<RatingReview> getTopRatedByContent(int idIn);

	public List<RatingReview> getTopRatedByService(int idIn);

	public double getTotalOfServicesByUser(int idIn);

	public List<RatingReview> getReviewsOfUserByUserId(int idIn);

	public User checkUserRegistration(User userIn);

}
