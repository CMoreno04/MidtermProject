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
		service = em.find(Service.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		service = null;

	}

	@Test
	@DisplayName("Checks if service 1 is Netflix")
	void check_service_name() {
		assertNotNull(service);
		assertEquals("netflix", service.getName().toLowerCase());
	}

	@Test
	@DisplayName("Checks service price")
	void check_service_price() {
		assertNotNull(service);
		assertEquals(8.99, service.getMonthlyPrice());
	}
	
	@Test
	@DisplayName("Check service Id")
	void check_service_id() {
		assertNotNull(service);
		assertEquals(1, service.getId());
	}

}
