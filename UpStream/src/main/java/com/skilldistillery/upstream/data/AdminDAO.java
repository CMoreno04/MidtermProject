package com.skilldistillery.upstream.data;

import java.util.List;

import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.User;

interface AdminDAO {

	List<User> getUsers();

	List<RatingReview> getReviews(int userId);

	List<User> getUser(int userId);

}
