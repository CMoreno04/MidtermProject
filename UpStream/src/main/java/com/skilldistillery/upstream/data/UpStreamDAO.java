package com.skilldistillery.upstream.data;

import java.util.List;

import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.StreamService;
import com.skilldistillery.upstream.entities.User;
import com.skilldistillery.upstream.entities.UserService;

public interface UpStreamDAO {

	// Content
	public List<Content> getTopContent(int serviceId);

	public List<Content> getFavoritesOfUserById(int idIn);

	public List<Content> getWishListOfUser(int idIn);

	public Content getContent(int id);
	
	//Service 

	public StreamService getService(int id);

	public List<StreamService> getServices();
	
	public boolean removeUserService(int userId, int servId);
	
	
	//Rating

	public List<RatingReview> getTopRatedByContent(int idIn);

	public List<RatingReview> getTopRatedByService(int idIn);

	public List<RatingReview> getReviewsOfUserByUserId(int idIn);

	// User

	public List<StreamService> getUserServices(User user);

	public double getTotalOfServicesByUser(int idIn);

	public List<Content> getUserContent(int idIn);


	// Admin
	
	public boolean disableUser(User userIn);

	public boolean removeUser(User user);
	
//	public boolean addUserService(UserService userServ);

	public boolean addUserService(User user, int sid);



}
