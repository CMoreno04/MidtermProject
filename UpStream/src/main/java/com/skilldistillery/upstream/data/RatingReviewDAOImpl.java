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
public class RatingReviewDAOImpl implements RatingReviewDAO {
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<RatingReview> getTopRatedByContentId(int idIn) {
		String jpql = "SELECT r FROM RatingReview r WHERE r.content.id=:id ORDER BY r.id DESC";
		List<RatingReview> reviews = em.createQuery(jpql, RatingReview.class).setParameter("id", idIn).getResultList();
		return reviews;
	}
	
	@Override
	public RatingReview createReview(RatingReview rating) {
		em.persist(rating);
		em.flush();
		return rating;
	}
	
	@Override
	public RatingReview updateReview(int id, RatingReview rating) {
		RatingReview foundRating = em.find(RatingReview.class, id);
		foundRating.setUserId(rating.getUserId());
		foundRating.setContent(rating.getContent());
		foundRating.setRating(rating.getRating());
		foundRating.setComment(rating.getComment());
		em.flush();
		return foundRating;
		
	}
	
	@Override
	public boolean deleteReview(int id) {
		RatingReview foundRating = em.find(RatingReview.class, id);
		em.remove(foundRating);
		em.flush();
		return (foundRating == null);
	}

	@Override
	public RatingReview getRatingById(int revId) {
		return em.find(RatingReview.class, revId);
	}
	
	@Override
	public List<RatingReview> getRatingByUserId(int userId, int contentId) {
		String query = "SELECT r FROM RatingReview r WHERE r.userId = :uid AND r.content.id = :cid";
		List<RatingReview> userReviews = em.createQuery(query, RatingReview.class)
				.setParameter("uid", userId).setParameter("cid", contentId).getResultList();
		return userReviews;
	}

	@Override
	public List<Double> getAverageRating(int contentId) {
		String query = "SELECT AVG(r.rating) FROM RatingReview r WHERE r.content.id = :cid";
		List<Double> average = (List<Double>) em.createQuery(query).setParameter("cid", contentId).getResultList();
		return average;
	}
	
	@Override
	public List<Double> getAverageRatingList() {
		String query = "SELECT AVG(r.rating) FROM Content c JOIN c.ratingReviews r";
		List<Double> average = (List<Double>) em.createQuery(query).getResultList();
		return average;
	}
	
	@Override
	public List<Content> getService(int servId) {
		String query = "SELECT c FROM Content c JOIN FETCH c.service s WHERE s.id = :sid";	
		List<Content> service = em.createQuery(query, Content.class).setParameter("sid", servId).getResultList();
		return service;
	}
}