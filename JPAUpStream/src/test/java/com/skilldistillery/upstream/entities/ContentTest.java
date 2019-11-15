package com.skilldistillery.upstream.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ContentTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Content content;

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
		content = em.find(Content.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		content = null;
		
	}

	@Test
	@DisplayName("Checks if not null.")
	void test1() {
		assertNotNull(content);
		assertEquals("stranger things", content.getTitle()); 
	}
	
	@Test
	@DisplayName("Checks if not null.")
	void test2() {
		assertNotNull(content);
		assertEquals("strange little girl", content.getDescription().toLowerCase()); 
	}
	
//	@Test
//	void test3() {
//		assertNotNull(content);
//		assertEquals("horror.", content.getGenre()); // edit as nessesary when genras are made.
//	} 
	
//	@Test
//	void test4() {
//		assertNotNull(content);
//		assertEquals("", content.getImageLink());   //edit when an image link is added
//	}

//	@Test
//	void test5() {
//		assertNotNull(content);
//		assertEquals(1, content.getReviewId());   //edit when review id is added
//	}
	
	@Test
	void test6() {
		assertNotNull(content);
		assertEquals(1, content.getServiceId()); 
	}
	
}
