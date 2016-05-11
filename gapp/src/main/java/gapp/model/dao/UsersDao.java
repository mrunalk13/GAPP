package gapp.model.dao;

import java.util.List;


import gapp.model.Gappusers;

public interface UsersDao {
	
	Gappusers getUser(String email, String password);
	Gappusers getUser1(String email);
	Gappusers saveUser(Gappusers user);
	List<Gappusers> getTotalUsers();
	Gappusers getUser(Integer id);
}
