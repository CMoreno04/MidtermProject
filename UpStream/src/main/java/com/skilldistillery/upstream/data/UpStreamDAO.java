package com.skilldistillery.upstream.data;

import java.util.List;

import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.StreamService;

public interface UpStreamDAO {
	public List<Content> getTopContent(int serviceId);	
	public List<StreamService> getServices();
	public List<RatingReview> getTopRatedByContent(int idIn);
	public List<RatingReview> getTopRatedByService(int idIn);
}
