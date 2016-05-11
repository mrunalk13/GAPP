package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Departments;
import gapp.model.Programs;
import gapp.model.dao.ProgramsDao;

@Repository
public class ProgramsDaoImpl implements ProgramsDao{
	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<Programs> getPrograms() {
		return entityManager.createQuery( "from Programs", Programs.class )
	            .getResultList();
	}

	@Override
	public Programs getPrograms1(Integer id) {
		return entityManager.find(Programs.class, id);
	}

	@Override
	@Transactional
	public Programs SaveProgram(Programs program) {
		return entityManager.merge(program);
	}

	@Override
	@Transactional
	public void deleteProgram(Integer id) {
		entityManager.createQuery( "delete " + Programs.class.getName() 
				 + " where program_id = "+id)
		          .executeUpdate();
		
	}

	@Override
	public List<Programs> getPrograms1(String dptname) {
		return entityManager.createQuery( "from Programs p where p.dept.name = :dptname", Programs.class )
				.setParameter("dptname", dptname)
	            .getResultList();
	}

	@Override
	public Programs getProgram(String prgName) {
		return entityManager.createQuery( "from Programs p where p.name = :prgName", Programs.class )
				.setParameter("prgName", prgName)
	            .getSingleResult();
	}

	@Override
	public List<Programs> getProgramsByDepartment(Integer id) {
		return entityManager.createQuery( "from Programs p where p.dept.dept_id = :id", Programs.class )
				.setParameter("id", id)
	            .getResultList();
	}

}
