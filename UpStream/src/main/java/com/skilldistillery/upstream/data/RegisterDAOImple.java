package com.skilldistillery.upstream.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.upstream.entities.User;

@Transactional
@Service
public class RegisterDAOImple implements RegisterDAO {

//	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("UpStreamPU");
//	private EntityManager em = emf.createEntityManager();
	@PersistenceContext
	private EntityManager em;

	@Override
	public User addUser(User user) {

//		em.getTransaction().begin();

		em.persist(user);
		em.flush();

//		em.getTransaction().commit();

		return user;
	}
	@Override
	public boolean checkIsUniqueUser(User user) {
		String jpql = "SELECT u FROM User u";

		List<User> userCheck = em.createQuery(jpql, User.class).getResultList();
		
		if (user != null) {
			for (User userInDB : userCheck) {
				if (userInDB.getUsername().equalsIgnoreCase(user.getUsername())) {

					return true;
				}
			}
		}

		return false;

	}
}
