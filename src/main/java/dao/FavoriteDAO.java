package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entity.Favorites;
import utils.JpaUtils;

public class FavoriteDAO {
	private EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		em.close();
	}

	public Favorites create(Favorites entity) {
		Favorites fav = findUserLikeVideo(entity.getVideo().getId(), entity.getUser().getId());
		if(fav == null) {
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
		return fav;
	}

	public Favorites update(Favorites entity) {
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

	public Favorites remove(String id) {
		Favorites entity = findById(id);
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

	public Favorites findById(String id) {
		Favorites entity = em.find(Favorites.class, Long.parseLong(id));
		return entity;
	}

	public List<Favorites> findAll() {
		String jpql = "SELECT o FROM Favorites o";
		TypedQuery<Favorites> query = em.createQuery(jpql, Favorites.class);
		List<Favorites> list = query.getResultList();
		return list;
	}

	public List<Favorites> findId(String key) {
		// Tạo câu lệnh truy vấn
		String tv = "Select o From Favorites o Where o.user.id = :id";
		// Tạo đối tượng truy vấn
		TypedQuery<Favorites> query = em.createQuery(tv, Favorites.class);
		query.setParameter("id", key);
		List<Favorites> list = query.getResultList();
		return list;
	}
	
	public Favorites findUserLikeVideo(String videoId, String userId) {
		Favorites fav = null;
		String tv = "SELECT o FROM Favorites o WHERE o.video.id = :vid and o.user.id = :uid";
		TypedQuery<Favorites> query = em.createQuery(tv, Favorites.class);
		query.setParameter("vid", videoId);
		query.setParameter("uid", userId);
		try {
			fav = query.getSingleResult();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return fav;
	}
}
