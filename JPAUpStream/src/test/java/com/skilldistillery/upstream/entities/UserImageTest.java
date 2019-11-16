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


class UserImageTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserImage userImage;

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
		userImage = em.find(UserImage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		userImage = null;
		
	}

//	@Test
//	@DisplayName("Checks if not null.")
//	void test1() {
//		assertNotNull(userImage);
//		assertEquals("stranger things", userImage.getUrl()); 
		
//	}
	
	
}
