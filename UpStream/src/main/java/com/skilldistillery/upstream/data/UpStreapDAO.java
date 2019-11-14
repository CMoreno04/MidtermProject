package com.skilldistillery.upstream.data;

import java.util.List;

public interface UpStreapDAO {

	public List<Service> getAllServices();
	
	public void getContentByService();
	
	public List<Review> getReviews();
	
	public void getCustomers();
	
}
