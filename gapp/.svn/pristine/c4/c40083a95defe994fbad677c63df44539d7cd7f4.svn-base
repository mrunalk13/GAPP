package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import gapp.model.Departments;
import gapp.model.Terms;
import gapp.model.dao.TermsDao;

@Repository
public class TermsDaoImpl implements TermsDao {
    @PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<Terms> getTerms() {
		 return entityManager.createQuery( "from Terms order by term_id", Terms.class )
		            .getResultList();
	}

	@Override
	public Terms getTerm(Integer id) {
		 return entityManager.createQuery( "from Terms t where t.term_id = :id", Terms.class )
				 .setParameter("id", id)
				 .getSingleResult();
	}


}
