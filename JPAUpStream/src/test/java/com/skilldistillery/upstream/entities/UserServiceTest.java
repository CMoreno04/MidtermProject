package com.skilldistillery.upstream.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class UserServiceTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserService userService;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("UpStreamPU");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		UserServiceId usid = new UserServiceId();
		usid.setServiceId(1);
		usid.setUserId(1);
		userService = em.find(UserService.class, usid);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		userService = null;

	}

	@Test
	@DisplayName("Checks if not null.")
	void test2() {
		assertNotNull(userService);
		assertEquals("2003-04-11", userService.getSubscribeDate().toString());
	}

}
