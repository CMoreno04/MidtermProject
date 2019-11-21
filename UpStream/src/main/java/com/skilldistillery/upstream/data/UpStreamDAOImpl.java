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

@Transactional
@Service
public class UpStreamDAOImpl implements UpStreamDAO {

	@PersistenceContext
	private EntityManager em;

	public List<Content> getTopContent(int serviceId) {
		String query = "SELECT c FROM Content c JOIN FETCH c.service s WHERE s.id = :sid ORDER BY c.id DESC";
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

	public double getTotalOfServicesByUser(int userId) {
		double total = 0;

		User user = em.find(User.class, userId);

		String jpql = "SELECT u FROM UserService u WHERE u.users.id=:userId";

		List<UserService> userservices = em.createQuery(jpql, UserService.class).setParameter("userId", user.getId())
				.getResultList();

		for (UserService service : userservices) {
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

	public List<Content> getWishListOfUser(int idIn) {
		List<Content> wishlist = new ArrayList<Content>();

		for (UserContent content : em.find(User.class, idIn).getUserCont()) {
			if (content.isWishlist()) {
				wishlist.add(content.getUserContent());
			}
		}
		return wishlist;
	}

	public List<RatingReview> getReviewsOfUserByUserId(int idIn) {
		String jpql = "SELECT r FROM RatingReview r WHERE r.userId = :id";

		List<RatingReview> reviews = em.createQuery(jpql, RatingReview.class).setParameter("id", idIn).getResultList();

		return reviews;
	}

	@Override
	public boolean disableUser(User user) {

		try {
			user = em.find(User.class, ((int) user.getId()));
			user.setActive(false);

			em.persist(user);

			em.flush();

			return true;

		} catch (Exception e) {

			e.printStackTrace();

			return false;
		}

	}

	@Override
	public boolean removeUser(User userIn) {
		User user = em.find(User.class, userIn.getId());

		try {

			em.remove(user);
			em.flush();

			return true;
		}

		catch (Exception e) {

			return false;
		}

	}

	@Override
	public List<StreamService> getUserServices(User user) {
		List<StreamService> streamingServ = new ArrayList<StreamService>();

		String jpql = "SELECT u FROM UserService u WHERE u.users.id=:userId";

		List<UserService> userservices = em.createQuery(jpql, UserService.class).setParameter("userId", user.getId())
				.getResultList();

		if (userservices != null) {

			for (UserService service : userservices) {
				streamingServ.add(service.getService());
			}
		}
		return streamingServ;
	}

	@Override
	public List<Content> getUserContent(int idIn) {
		List<Content> userContent = new ArrayList<Content>();

		User user = em.find(User.class, idIn);
		if (user.getUserCont() != null) {
			for (UserContent content : user.getUserCont()) {
				userContent.add(content.getUserContent());
			}
		}
		return userContent;
	}

//	@Override
//	public List<UserContent> addUserContent(int idIn, int contentId) {
//		User user = em.find(User.class, idIn);
//		List<UserContent> userContent = user.getUserCont();
//
//		for (UserContent content : user.getUserCont()) {
//			userContent.add()
//		}
//		return userContent;
//	}
//	

	@Override
	public boolean removeUserService(int userId, int servId) {

		String jpql = "SELECT u FROM UserService u WHERE u.users.id=:userId AND u.service.id=:servId";

		List<UserService> us = em.createQuery(jpql, UserService.class).setParameter("userId", userId)
				.setParameter("servId", servId).getResultList();

		try {

			em.remove(us.get(0));

			em.flush();

			return true;

		}

		catch (Exception e) {

			return false;
		}

	}

	public boolean addUserService(int userId, int sid) {
		User user = em.find(User.class, userId);

		System.out.println(user);

		UserService us = new UserService(LocalDate.now(), true, user, em.find(StreamService.class, sid));
		try {

			em.persist(us);
			em.flush();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean addUserContent(int userIn, int cid) {

		User user = em.find(User.class, userIn);

		System.out.println(user);

		UserContent uc = new UserContent(em.find(Content.class, cid), user, false, false);

//		if (!user.getUserCont().contains(uc)) {

		try {
			em.persist(uc);
			em.flush();

			return true;
		}

		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
//		}

//		return false;
	}

	@Override
	public boolean removeUserContent(int userId, int contentId) {
		String jpql = "SELECT u FROM UserContent u WHERE u.userContent.id=:contentId AND u.user.id=:userId";

		List<UserContent> us = em.createQuery(jpql, UserContent.class).setParameter("contentId", contentId)
				.setParameter("userId", userId).getResultList();

		try {

			em.remove(us.get(0));

			em.flush();

			return true;

		}

		catch (Exception e) {

			return false;
		}
	}

//Admin
	@Override
	public Content createContent(Content content) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserService> getUserServicesByUserId(int userId) {
		String jpql = "SELECT u FROM UserService u WHERE u.users.id=:userId ORDER BY u.service.id";

		List<UserService> usrServ = em.createQuery(jpql, UserService.class).setParameter("userId", userId)
				.getResultList();

		return usrServ;
	}

	@Override
	public boolean checkIfUserHasService(int userId, int servId) {
		UserService usrServ;
		try {
			String jpql = "SELECT u FROM UserService u WHERE u.users.id=:userId AND u.service.id=:servId";

			usrServ = em.createQuery(jpql, UserService.class).setParameter("userId", userId)
					.setParameter("servId", servId).getSingleResult();
		} catch (Exception e) {
			usrServ = null;
		}

//		User user = em.find(User.class, userId);

		if (usrServ == null) {

			return true;

		}

		else {
			return false;
		}

	}

	@Override
	public User getUserById(int id) {

		return em.find(User.class, id);
	}

	@Override
	public boolean checkIfUserHasContent(int userId, int contentId) {

		UserContent userCont;
		
		try {
			String jpql = "SELECT u FROM UserContent u WHERE u.user.id=:userId AND u.userContent.id=:contentId";

			userCont = em.createQuery(jpql, UserContent.class).setParameter("userId", userId)
					.setParameter("contentId", contentId).getSingleResult();
		} catch (Exception e) {
			userCont = null;
		}

//		User user = em.find(User.class, userId);

		if (userCont == null) {

			return true;

		}

		else {
			return false;
		}

	}

	@Override
	public List<Content> getContentByKeyword(String input) {

		String jpql = "SELECT c FROM Content c WHERE c.title LIKE %:input% OR c.description LIKE %:input%";

		List<Content> contents = em.createQuery(jpql, Content.class).setParameter("input", input).getResultList();

		return contents;
	}

}
