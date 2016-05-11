package gapp.model.dao;

import java.util.List;

import gapp.model.AdditionalFieldValue;

public interface AdditionalFieldValueDao {
	
   List<AdditionalFieldValue> getAdditionalFieldValue(Integer applicationId);
   AdditionalFieldValue SaveAFV(AdditionalFieldValue afv);
   AdditionalFieldValue getAFVbyId(Integer id);
   void UpdateFile(byte[] file, String fname, Integer id);
   void UpdateFieldValue(String fvalue, Integer id);
}
