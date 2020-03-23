package com.skilldistillery.upstream.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.upstream.entities.User;

@Transactional
@Service
public class LoginDAOImpl implements LoginDAO {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("UpStreamPU");
	private EntityManager em = emf.createEntityManager();

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


	@Override
	public User findUserByUsernameAndPassword(String usernameIn, String passwordIn) {
		User user;

		try {
			String jpql = "SELECT u FROM User u WHERE u.username LIKE :usernameIn AND u.password LIKE :passwordIn";
			
			user = em.createQuery(jpql, User.class).setParameter("usernameIn", usernameIn)
					.setParameter("passwordIn", passwordIn).getSingleResult();

		}

		catch (Exception e) {
			user = null;
		}

		return user;
	}
}
