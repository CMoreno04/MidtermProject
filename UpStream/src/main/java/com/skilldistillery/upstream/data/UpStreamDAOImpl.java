package com.skilldistillery.upstream.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.StreamService;

@Transactional
@Service
public class UpStreamDAOImpl implements UpStreamDAO {
	@PersistenceContext
	private EntityManager em;

	public List<Content> getTopContent(int serviceId) {
		String query = "SELECT c FROM Content c JOIN FETCH c.service s WHERE s.id = :sid";
		List<Content> content = em.createQuery(query, Content.class).setParameter("sid", serviceId).getResultList();
		return content;
	}
	
	public List<StreamService> getServices() {
		String query = "SELECT s FROM StreamService s";
		List<StreamService> services = em.createQuery(query, StreamService.class).getResultList();
		return services;
	}
	
	public StreamService getService(int id) {
		String query = "SELECT s FROM StreamService s where s.id = :sid";
		List<StreamService> services = em.createQuery(query, StreamService.class).setParameter("sid", id).getResultList();
		return services.get(0);
	}
}
