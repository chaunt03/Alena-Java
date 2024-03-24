package dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import entity.Videos;
import utils.JpaUtils;

public class VideoDAO {
	private EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		em.close();
	}

	public Videos create(Videos entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			// TODO: handle exception
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}

	public Videos update(Videos entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			// TODO: handle exception
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}

	public Videos remove(String id) {
		Videos entity = this.findById(id);
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			// TODO: handle exception
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}

	public Videos findById(String id) {
		Videos entity = em.find(Videos.class, id);
		return entity;
	}

	public List<Videos> findAll() {
		String jpql = "SELECT o FROM Videos o";
		TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
		List<Videos> list = query.getResultList();
		return list;
	}
	
	public List<Videos> findKeyword(String keyword) {
//		String jpql = "SELECT DISTINCT o.video FROM Favorites o "
//				+ "WHERE o.video.title LIKE :keyword";
		TypedQuery<Videos> query = em.createNamedQuery("Video.findByKeyWord", Videos.class);
		query.setParameter("keyword", "%"+keyword+"%");
		List<Videos> list = query.getResultList();
		
		return list;
	}
	
	public List<Videos> findFavoriteRadio(Boolean favorite) {
		String jpql = "SELECT o FROM Videos o WHERE o.favorites IS EMPTY";
		if(favorite) {
			jpql =  "SELECT o FROM Videos o WHERE o.favorites IS NOT EMPTY";
		}
		TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
		List<Videos> list = query.getResultList();
		return list;
	}
	
	public List<Videos> findInRange(Date min, Date max) {
		TypedQuery<Videos> query = em.createNamedQuery("Video.findInRange", Videos.class);
		query.setParameter("min", min, TemporalType.DATE);
		query.setParameter("max", max, TemporalType.DATE);
		List<Videos> list = query.getResultList();
		return list;
	}
	
	
	public List<Videos> findInMonths(String[] values) {
		List<Integer> months = new ArrayList<Integer>();
		for(String month: values) {
			months.add(Integer.valueOf(month));
		}
		TypedQuery<Videos>query=em.createNamedQuery("Video.findInMonths",Videos.class);
		query.setParameter("months", months);
		List<Videos> list = query.getResultList();
		return list;	
	}
	
	public List<Videos> randomTop10() {
		Query query = em.createNamedQuery("Report.random10");
		List<Videos> list = query.getResultList();
		return list;
	}
	
	
}
