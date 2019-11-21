package com.skilldistillery.upstream.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.upstream.entities.Genre;
import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.StreamService;
import com.skilldistillery.upstream.entities.User;

interface AdminDAO {

	List<User> getUsers();

	List<RatingReview> getReviews(int userId);

	List<User> getUser(int userId);

	List<Genre> getGenre();

	StreamService getService(int id);

}
