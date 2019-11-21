package com.skilldistillery.upstream.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.upstream.entities.User;
import com.skilldistillery.upstream.entities.UserImage;

@Transactional
@Service
public class UserProfileDaoImpl implements UserProfileDao {
	@PersistenceContext
	private EntityManager em;


	@Override
	public List<UserImage> getProfilePics() {
		String qry = "SELECT img FROM UserImage img";
		List<UserImage> ui = em.createQuery(qry, UserImage.class).getResultList();
		return ui;
	}

	@Override
	public User addUserProfilePic(int userId, int pid) {
		User user = em.find(User.class, userId);

		System.out.println(user);

		user.setUserImage(em.find(UserImage.class, pid));
		
		try {

			em.persist(user);
			em.flush();

			return user;

		} catch (Exception e) {
			e.printStackTrace();
			return user;
		}
	}

	@Override
	public UserImage getImageById(int pid) {
		String qry = "SELECT img FROM UserImage img WHERE img.id = :imgId";
		UserImage ui = em.createQuery(qry, UserImage.class).setParameter("imgId", pid).getSingleResult();
				
		return ui;
	}

}
