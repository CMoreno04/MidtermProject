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

class ServiceTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Service service;

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
		service = em.find(Service.class, 4);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		service = null;
		
	}

	@Test
	@DisplayName("Checks if service 1 is Netflix")
	void test1() {
		assertNotNull(service);
		assertEquals("netflix", service.getName().toLowerCase());
	}
	
	@Test
	@DisplayName("Checks if first film in netflix is stranger things")
	void test2() {
		assertEquals("stranger things", service.getContents().get(0).getTitle().toLowerCase());
	}
	
	@Test
	@DisplayName("Checks netflix price")
	void test3() {
		assertEquals(8.99, service.getMonthlyPrice());
	}
}
