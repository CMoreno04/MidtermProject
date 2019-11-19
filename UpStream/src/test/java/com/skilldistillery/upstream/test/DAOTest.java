package com.skilldistillery.upstream.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.data.UpStreamDAOImpl;
import com.skilldistillery.upstream.entities.UserService;

@SpringBootTest
public class DAOTest {
	
	@PersistenceContext
	private EntityManager em;
	
	
	private UserService userService;
	
	
	@Autowired
	private UpStreamDAO dao;

	@BeforeEach
	void setUp() throws Exception {
		dao = new UpStreamDAOImpl();
		userService= new UserService();
	}

	@AfterEach
	void tearDown() throws Exception {
		dao = null;
		userService= null;
	}

	@Test
	private void testAddUserService() {
		assertEquals(true, dao.addUserService(userService));

	}
}
