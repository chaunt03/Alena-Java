package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entity.Users;
import utils.JpaUtils;

public class UserDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		em.close();
	}
	
	public Users create(Users entity) {
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
	
	public Users update(Users entity) {
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
	
	public Users remove(String id) {
		Users entity = this.findById(id);
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
	
	public Users findById(String id) {
		Users entity = em.find(Users.class, id);
		return entity;
	}
	
	public List<Users> findAll() {
		String jpql = "SELECT o FROM Users o";
		TypedQuery<Users> query = em.createQuery(jpql, Users.class);
		List<Users> list = query.getResultList();
		return list;
	}
	
	public List<Users> findByVdId(String videoId) {
		String jpql = "SELECT o.user FROM Favorites o WHERE o.video.id=:vid";
		TypedQuery<Users> query = em.createQuery(jpql, Users.class);
		query.setParameter("vid", videoId);
		List<Users> list = query.getResultList();
		
		return list;
	}
}
