package gapp.model.dao.jpa;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Applications;
import gapp.model.Degrees;
import gapp.model.Status;
import gapp.model.dao.ApplicationsDao;

@Repository
public class ApplicationsDaoImpl implements ApplicationsDao {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Applications> getApplications(String department,String term)
    {
    	String query = "Select a from Applications a join a.dept d join a.term t where d.name = :vdepartment "
      		  + "and t.term = :vterm ";

      return entityManager.createQuery( query, Applications.class )
          .setParameter( "vdepartment", department )
          .setParameter( "vterm", term )
          .getResultList();

       
    }

	@Override
	public List<Applications> getApplications(String username) {
		String query = "from Applications a where a.user.email = :username";

		return entityManager.createQuery( query, Applications.class )
	          .setParameter( "username", username )
	          .getResultList();

	}

	@Override
	public Applications getApplication(Integer id) {
		String query = "from Applications a where a.application_id = :id";
		
		return entityManager.createQuery( query, Applications.class )
		          .setParameter( "id",id)
		          .getSingleResult();
	}

	@Override
	@Transactional
	public Applications saveApplication(Applications application) {
		return entityManager.merge(application);
	}

	@Override
	@Transactional
	public void submitApplication(Status status, Date submitted_date, Integer id) {
		 entityManager.createQuery( "update " + Applications.class.getName() 
				 + " set status = :status,submitted_date = :submitted_date where application_id = :id")
		 		  .setParameter("status", status)
		 		  .setParameter("submitted_date", submitted_date)
		 		  .setParameter("id", id)
		          .executeUpdate();
	}

		
}