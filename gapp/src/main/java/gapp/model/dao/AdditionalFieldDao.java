package gapp.model.dao;

import java.util.List;

import gapp.model.AdditionalField;

public interface AdditionalFieldDao {

	List<AdditionalField> getAdditionalFields(Integer id);
	AdditionalField saveAdditionalField(AdditionalField field);
	void deleteField(Integer id);
	AdditionalField getAdditionalFieldbyId(Integer id);
}
