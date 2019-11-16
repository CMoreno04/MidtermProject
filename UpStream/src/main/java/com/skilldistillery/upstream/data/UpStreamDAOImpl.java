package com.skilldistillery.upstream.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.StreamService;
import com.skilldistillery.upstream.entities.User;
import com.skilldistillery.upstream.entities.UserContent;
import com.skilldistillery.upstream.entities.UserService;

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

	public StreamService getService(int id) {
		String query = "SELECT s FROM StreamService s where s.id = :sid";
		List<StreamService> services = em.createQuery(query, StreamService.class).setParameter("sid", id)
				.getResultList();
		return services.get(0);
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

	public double getTotalOfServicesByUser(int idIn) {
		double total = 0;

		User user = em.find(User.class, idIn);

		for (UserService service : user.getUserService()) {
			total += service.getService().getMonthlyPrice();
		}

		return total;
	}

	public List<Content> getFavoritesOfUserById(int idIn) {
		List<Content> favorites = new ArrayList<Content>();

		for (UserContent content : em.find(User.class, idIn).getUserCont()) {
			if (content.isFavorites()) {
				favorites.add(content.getUserContent());
			}
		}

		return favorites;
	}

	public List<RatingReview> getReviewsOfUserByUserId(int idIn) {
		String jpql = "SELECT r FROM RatingReview r WHERE r.userId = :id";

		List<RatingReview> reviews = em.createQuery(jpql, RatingReview.class).setParameter("id", idIn).getResultList();

		return reviews;
	}

	@Override
	public User checkUserRegistration(User userIn) {
		User user;

		try {
			String jpql = "SELECT u FROM User u WHERE u.username LIKE :usernameIn AND u.password LIKE :passwordIn";

			user = em.createQuery(jpql, User.class).setParameter("usernameIn", userIn.getUsername())
					.setParameter("passwordIn", userIn.getPassword()).getSingleResult();
			user = userIn;
		}

		catch (Exception e) {
			user = null;
		}

		return user;
	}
//	@Override
//	public int getTotalOfServicesByUser(int idIn) {
//		User user = em.find(User.class, idIn);
//
//		int total = 0;
//
//		return 0;
//	}

}
