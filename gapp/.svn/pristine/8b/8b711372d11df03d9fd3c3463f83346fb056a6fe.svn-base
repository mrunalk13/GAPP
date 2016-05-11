package gapp.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;


import gapp.model.Status;
import gapp.model.dao.StatusDao;

@Repository
public class StatusDaoImpl implements StatusDao {
    @PersistenceContext
    private EntityManager entityManager;

	@Override
	public Status getStatus(Integer id) {
		
		return entityManager.createQuery( "from Status s where s.status_id = :id", Status.class )
				.setParameter("id", id)
	            .getSingleResult();
		
	}

}
