package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.AdditionalField;
import gapp.model.Programs;
import gapp.model.dao.AdditionalFieldDao;

@Repository
public class AdditionalFieldDaoImpl implements AdditionalFieldDao{
	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<AdditionalField> getAdditionalFields(Integer id) {
		return entityManager.createQuery("from AdditionalField a where a.dept.dept_id = :id ", AdditionalField.class)
				.setParameter("id", id)
				.getResultList();

	}

	@Override
	@Transactional
	public AdditionalField saveAdditionalField(AdditionalField field) {
		return entityManager.merge(field);
	}

	@Override
	@Transactional
	public void deleteField(Integer id) {
		entityManager.createQuery( "delete " + AdditionalField.class.getName() 
				 + " where field_id = "+id)
		          .executeUpdate();
		
	}

	@Override
	public AdditionalField getAdditionalFieldbyId(Integer id) {
		return entityManager.createQuery("from AdditionalField a where a.field_id = :id ", AdditionalField.class)
				.setParameter("id", id)
				.getSingleResult();
	}

	

	

}
