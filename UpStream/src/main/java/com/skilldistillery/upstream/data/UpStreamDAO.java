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
	

	public List<Content> getContentByKeyword(String input);

	public Content getRandom();

	// Service

	public StreamService getService(int id);

	public List<StreamService> getServices();

	public boolean removeUserService(int userId, int servId);

	public List<UserService> getUserServicesByUserId(int userId);

	// Rating

	public List<RatingReview> getTopRatedByContent(int idIn);

	public List<RatingReview> getTopRatedByService(int idIn);

	public List<RatingReview> getReviewsOfUserByUserId(int idIn);

	// User

	public boolean addUserService(int userId, int sid);

	public List<StreamService> getUserServices(User user);

	public double getTotalOfServicesByUser(int idIn);

	public List<Content> getUserContent(int idIn);

	public boolean addUserContent(int userId, int cid);

	public User getUserById(int id);

	// Admin

	public boolean disableUser(User userIn);

	public boolean removeUser(User user);

	public Content createContent(Content content);

	boolean removeUserContent(int userId, int contentId);

	public boolean checkIfUserHasService(int userId, int servId);

	public boolean checkIfUserHasContent(int userId, int contentId);


	boolean disableUserFromAdmin(int userId);

	boolean enableUserFromAdmin(int userId);

}
