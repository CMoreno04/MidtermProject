package com.skilldistillery.upstream.data;

import java.util.List;

import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.Service;
import com.skilldistillery.upstream.entities.User;

public interface UpStreamDAO {

	public List<Service> getAllServices();
	
	public void getContentByService();
	
	public List<RatingReview> getReviews();
	
	public void getCustomers();
	
	public List<User> getUsers();
}
