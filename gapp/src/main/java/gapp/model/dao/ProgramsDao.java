package gapp.model.dao;

import java.util.List;

import gapp.model.Programs;

public interface ProgramsDao {

	List<Programs> getPrograms();
	Programs getPrograms1(Integer id);
	Programs SaveProgram(Programs program);
	void deleteProgram(Integer id);
	List<Programs> getPrograms1(String dptname);
	Programs getProgram(String prgName);
	List<Programs> getProgramsByDepartment(Integer id);
}
