package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.AdditionalFieldValue;
import gapp.model.Degrees;
import gapp.model.dao.AdditionalFieldValueDao;

@Repository
public class AdditionalFieldValueDaoImpl implements AdditionalFieldValueDao{
	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<AdditionalFieldValue> getAdditionalFieldValue(Integer applicationId) {
		String query = "from AdditionalFieldValue a where a.application.application_id = :applicationId";

		return entityManager.createQuery( query, AdditionalFieldValue.class )
	          .setParameter( "applicationId", applicationId )
	          .getResultList();
	}

	@Override
	@Transactional
	public AdditionalFieldValue SaveAFV(AdditionalFieldValue afv) {
		return entityManager.merge(afv);
	}

	@Override
	public AdditionalFieldValue getAFVbyId(Integer id) {
		String query = "from AdditionalFieldValue a where a.fieldValue_id = :id";

		return entityManager.createQuery( query, AdditionalFieldValue.class )
	          .setParameter( "id", id )
	          .getSingleResult();
	}

	@Override
	@Transactional
	public void UpdateFile(byte[] file, String fname, Integer id) {
		 entityManager.createQuery( "update " + AdditionalFieldValue.class.getName() 
				 + " set value = :fname,file = :file where fieldValue_id = :id")
		 		  .setParameter("file", file)
		 		  .setParameter("fname", fname)
		 		  .setParameter("id", id)
		          .executeUpdate();
		
	}

	@Override
	@Transactional
	public void UpdateFieldValue(String fvalue, Integer id) {
		entityManager.createQuery( "update " + AdditionalFieldValue.class.getName() 
				 + " set value = :fvalue where fieldValue_id = :id")
		 		  .setParameter("fvalue", fvalue)		 		  
		 		  .setParameter("id", id)
		          .executeUpdate();
		
	}
}
