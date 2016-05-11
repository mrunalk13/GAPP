package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Applications;
import gapp.model.Departments;
import gapp.model.dao.DepartmentsDao;

@Repository
public class DepartmentsDaoImpl implements DepartmentsDao {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Departments> getDepartments()
    {
        return entityManager.createQuery( "from Departments order by dept_id", Departments.class )
            .getResultList();
    }

	@Override
	public Departments getDepartment(String name) {
		String query = "from Departments d where d.name = :name";

		return entityManager.createQuery( query, Departments.class )
	          .setParameter( "name", name )
	          .getSingleResult();
	}

	@Override
	@Transactional
	public Departments saveDepartment(Departments name) {
		return entityManager.merge(name);
	}

	@Override
	public Departments getDepartment(Integer id) {
		String query = "from Departments d where d.dept_id = :id";

		return entityManager.createQuery( query, Departments.class )
	          .setParameter( "id", id )
	          .getSingleResult();
	}

	@Override
	@Transactional
	public void editDepartment(Integer id, String name) {
		
		 entityManager.createQuery( "update " + Departments.class.getName() 
				 + " set name = '"+ name+"' where dept_id = "+id)
		          .executeUpdate();
		          
	}

	
	

	

	
}