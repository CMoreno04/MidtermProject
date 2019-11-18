package com.skilldistillery.upstream.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.upstream.entities.User;

@Transactional
@Service
public class RegisterDAOImple implements RegisterDAO {

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("UpStreamPU");
	private EntityManager em = emf.createEntityManager();

	@Override
	public User addUser(User user) {

		em.getTransaction().begin();

		em.persist(user);

		em.getTransaction().commit();

		return user;
	}
}
