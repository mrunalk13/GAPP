package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Degrees;
import gapp.model.Departments;
import gapp.model.Programs;
import gapp.model.dao.DegreesDao;


@Repository
public class DegreesDaoImpl implements DegreesDao {
    @PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<Degrees> getDegrees(Integer id) {
		String query = "from Degrees d where d.application.application_id = :id";

		return entityManager.createQuery( query, Degrees.class )
	          .setParameter( "id", id )
	          .getResultList();
	}

	
	@Override
	@Transactional
	public Degrees saveDegree(Degrees degree) {
		return entityManager.merge(degree);
	}


	@Override
	public Degrees getDegreebyId(Integer id) {
		String query = "from Degrees d where d.degree_id = :id";

		return entityManager.createQuery( query, Degrees.class )
	          .setParameter( "id", id )
	          .getSingleResult();
	}


	@Override
	@Transactional
	public void deleteDegree(Integer id) {
		entityManager.createQuery( "delete " + Degrees.class.getName()
				 + " where degree_id = "+id)
		          .executeUpdate();
		
	}


	@Override
	@Transactional
	public void updateTrasncript(byte[] trancript, String fname, Integer id) {
		 entityManager.createQuery( "update " + Degrees.class.getName() 
				 + " set transcript_name = :fname,transcript = :trancript where degree_id = :id")
		 		  .setParameter("trancript", trancript)
		 		  .setParameter("fname", fname)
		 		  .setParameter("id", id)
		          .executeUpdate();
	}
}
