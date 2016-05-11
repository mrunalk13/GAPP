package gapp.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import gapp.model.Departments; 	

@Repository
public interface DepartmentsDao {

    List<Departments> getDepartments();
    Departments getDepartment(String name);
    Departments saveDepartment(Departments name);
    Departments getDepartment(Integer id);
    void editDepartment(Integer id, String name);
}