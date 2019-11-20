package com.skilldistillery.upstream.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.User;

@Transactional
@Service
public class AdminDAOImpl implements AdminDAO {
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<User> getUsers() {
		String query = "SELECT u FROM User u";
		List<User> users = em.createQuery(query, User.class).getResultList();
		return users;
	}
	
	@Override
	public List<User> getUser(int userId) {
		String query = "SELECT u FROM User u WHERE u.id = :uid";
		List<User> user = em.createQuery(query, User.class).setParameter("uid", userId).getResultList();
		return user;
	}
	
	@Override
	public List<RatingReview> getReviews(int userId) {
		String query = "SELECT r FROM RatingReview r WHERE r.userId = :uid";
		List<RatingReview> reviews = em.createQuery(query, RatingReview.class).setParameter("uid", userId).getResultList();
		return reviews;
	}
	
	
	
}
