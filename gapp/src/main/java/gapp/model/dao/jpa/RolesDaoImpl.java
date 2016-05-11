package gapp.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import gapp.model.Roles;
import gapp.model.dao.RolesDao;


@Repository
public class RolesDaoImpl implements RolesDao {
    @PersistenceContext
    private EntityManager entityManager;

	@Override
	public Roles getrole(String role) {
		return entityManager.createQuery("from Roles r where r.role_type = :role ", Roles.class)
				.setParameter("role", role)
				.getSingleResult();
	}

}
