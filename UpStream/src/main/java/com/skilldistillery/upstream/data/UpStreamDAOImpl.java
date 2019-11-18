package com.skilldistillery.upstream.data;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.StreamService;
import com.skilldistillery.upstream.entities.User;
import com.skilldistillery.upstream.entities.UserContent;
import com.skilldistillery.upstream.entities.UserService;
import com.skilldistillery.upstream.entities.UserServiceId;

@Transactional
@Service
public class UpStreamDAOImpl implements UpStreamDAO {

	@PersistenceContext
	private EntityManager em;


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

	public Content getContent(int id) {
		String query = "SELECT c FROM Content c WHERE c.id = :cid";
		List<Content> cont = em.createQuery(query, Content.class).setParameter("cid", id).getResultList();
		return cont.get(0);
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

//	public List<Content> getWishListOfUser(int idIn) {
//		List<Content> wishlist = new ArrayList<Content>();
//		
//		for (UserContent content : em.find(User.class, idIn).getUserCont()) {
//			if (content.isWishlist()) {
//				wishlist.add(content.getUserContent());
//			}
//		}
//		return wishlist;
//	}

//	public List<Content> getWishListOfUser(int idIn) {
//		List<Content> wishlist = new ArrayList<Content>();
//
//		for (UserContent content : em.find(User.class, idIn).getUserCont()) {
//			if (content.isWishlist()) {
//				wishlist.add(content.getUserContent());
//			}
//		}
//		return wishlist;
//	}

	public List<RatingReview> getReviewsOfUserByUserId(int idIn) {
		String jpql = "SELECT r FROM RatingReview r WHERE r.userId = :id";

		List<RatingReview> reviews = em.createQuery(jpql, RatingReview.class).setParameter("id", idIn).getResultList();

		return reviews;
	}

	@Override
	public boolean disableUser(User userIn) {

		try {
			User user = em.find(User.class, userIn.getId());

			user.setActive(false);

			em.getTransaction().begin();

			em.persist(user);

			em.getTransaction().commit();

			return true;

		} catch (Exception e) {

			e.printStackTrace();

			return false;
		}

	}

	@Override
	public boolean removeUser(User user) {

		try {

			em.getTransaction().begin();

			em.remove(em.find(User.class, user.getId()));

			em.getTransaction().commit();

			return true;

		}

		catch (Exception e) {
			e.printStackTrace();

			return false;
		}

	}

	@Override
	public List<StreamService> getUserServices(User user) {
		List<StreamService> userServices = new ArrayList<StreamService>();

		for (UserService service : user.getUserService()) {
			userServices.add(service.getService());
		}
		return userServices;
	}

	@Override
	public List<Content> getUserContent(int idIn) {
		List<Content> userContent = new ArrayList<Content>();

		User user = em.find(User.class, idIn);

		for (UserContent content : user.getUserCont()) {
			userContent.add(content.getUserContent());
		}
		return userContent;
	}

	
	
	
	
	
	
	
	
	
	
	@Override
	public boolean removeUserService(int userId, int servId) {

		try {
			String jpql = "SELECT r FROM UserService r WHERE r.user.id=:userId AND r.service.id=:servId";

			em.getTransaction().begin();
			
			em.remove(em.createQuery(jpql, UserService.class).setParameter("userId", userId).setParameter("servId", servId).getSingleResult());

//			em.flush();
			
			em.getTransaction().commit();

			return true;

		}

		catch (Exception e) {
			e.printStackTrace();

			return false;
		}

	}

	@Override
	public boolean addUserService(int userId, int servId) {
		UserServiceId svcId = new UserServiceId(servId, userId);
		UserService svc = new UserService();
		svc.setId(svcId);
		try {
			
			em.persist(svc);
			em.flush();
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		
		
	}

}
