package gapp.model.dao;

import java.util.List;

import gapp.model.Applications;
import gapp.model.Degrees;

public interface DegreesDao {
	
 List<Degrees> getDegrees(Integer id);
 Degrees saveDegree(Degrees degree);
 Degrees getDegreebyId(Integer id);
 void deleteDegree(Integer id);
 void updateTrasncript(byte[] trancript, String fname, Integer id);
}
