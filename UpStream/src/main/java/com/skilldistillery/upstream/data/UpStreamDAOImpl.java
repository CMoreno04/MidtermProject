package com.skilldistillery.upstream.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.StreamService;

@Transactional
@Service
public class UpStreamDAOImpl implements UpStreamDAO {

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("UpStreamPU");
	private EntityManager em = emf.createEntityManager();

	public List<Content> getTopContent(int serviceId) {
		String query = "SELECT c FROM Content c JOIN FETCH c.service s WHERE s.id = :sid";
		List<Content> content = em.createQuery(query, Content.class).setParameter("sid", serviceId).getResultList();
		return content;
	}

	public List<StreamService> getServices() {
		String query = "SELECT s FROM StreamService s";
		List<StreamService> services = em.createQuery(query, StreamService.class).getResultList();
		return services;
	}

	public List<RatingReview> getTopRatedByContent(int idIn) {

		String jpql = "SELECT r FROM RatingReview r WHERE r.content.id=:id ORDER BY r.rating DESC";

		List<RatingReview> reviews = em.createQuery(jpql, RatingReview.class).setParameter("id", idIn).getResultList();

		return reviews;
	}

	public List<RatingReview> getTopRatedByService(int idIn) {
		String jpql = "SELECT r FROM RatingReview r WHERE r.content.service.id=:id ORDER BY r.rating DESC";
		
		List<RatingReview> reviews = em.createQuery(jpql, RatingReview.class).setParameter("id", idIn).getResultList();

		return reviews;
	}


}
