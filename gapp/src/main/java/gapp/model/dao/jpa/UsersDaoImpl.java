package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Gappusers;
import gapp.model.dao.UsersDao;

@Repository
public class UsersDaoImpl implements UsersDao {
    @PersistenceContext
    private EntityManager entityManager;

	@Override
	public Gappusers getUser(String email, String password) {
		return entityManager.createQuery("from Gappusers u where u.email = :email and u.password = :password", Gappusers.class)
				.setParameter("email", email)
				.setParameter("password", password)
				.getSingleResult();
		
	}
   
	@Override
	public Gappusers getUser1(String email) {
		return entityManager.createQuery( "from Gappusers u where u.email = :email", Gappusers.class )
				.setParameter("email", email)
				.getSingleResult();  
	}

	@Override
	@Transactional
	public Gappusers saveUser(Gappusers user) {
		return entityManager.merge(user);
	}

	@Override
	public List<Gappusers> getTotalUsers() {
		return entityManager.createQuery("from Gappusers order by user_id", Gappusers.class)
				.getResultList();
	}

	@Override
	public Gappusers getUser(Integer id) {
		return entityManager.createQuery( "from Gappusers u where u.user_id = :id", Gappusers.class )
				.setParameter("id", id)
				.getSingleResult(); 
	}

	
 
}
