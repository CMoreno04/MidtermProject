package com.skilldistillery.upstream.client;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.beans.factory.annotation.Autowired;

import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.data.UpStreamDAOImpl;
import com.skilldistillery.upstream.entities.User;

public class UpStreamDAOClient {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("UpStreamPU");
	private static EntityManager em = emf.createEntityManager();

	@Autowired
	private static UpStreamDAO dao = new UpStreamDAOImpl();

	public static void main(String[] args) {
		UpStreamDAOClient app = new UpStreamDAOClient();

		User user = new User(false, true, "tito", "123", "man", "ecko", null);

//		String jpql = "SELECT r FROM UserService r WHERE r.user.id=:userId AND r.service.id=:servId";
//		
//		System.out.println(em.createQuery(jpql, UserService.class).setParameter("userId", 3).setParameter("servId", 3).getSingleResult());
		
//		System.out.println(dao.removeUserService(3, 3));
		
		
		
		
	}

}
