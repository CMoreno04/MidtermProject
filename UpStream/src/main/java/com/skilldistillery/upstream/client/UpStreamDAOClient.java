package com.skilldistillery.upstream.client;

import java.time.LocalDate;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.data.UpStreamDAOImpl;
import com.skilldistillery.upstream.entities.StreamService;
import com.skilldistillery.upstream.entities.User;
import com.skilldistillery.upstream.entities.UserService;

public class UpStreamDAOClient {

	@PersistenceContext
	private EntityManager em;

	@Autowired
	private static UpStreamDAO dao = new UpStreamDAOImpl();

	public static void main(String[] args) {
		UpStreamDAOClient app = new UpStreamDAOClient();

		User user = new User(false, true, "tito", "123", "man", "ecko", null);

		StreamService streamServ = new StreamService("HULU", 2.99);


		UserService usrServ = new UserService(LocalDate.now(), true, user, streamServ);

//		em.getTransaction().begin();
//		em.persist(usrServ);
//		em.getTransaction().commit();
//		
//		em.close();
//		
//		emf.close();


		//System.out.println(dao.addUserService(usrServ));


	}

}
